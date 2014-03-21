import csv
from bottle import Bottle, template, run, request

bottle = Bottle()

loc_pin_dict = {}
pin_list = []

# Called from appengine_config.py during initialization
def create_dictionary():
	with open('DE2_pin_assignments.csv', 'rb') as f:
		reader = csv.reader(f)
		pins = [row for row in reader]
		pins = pins[7:]

	for row in pins:
		pin_list.append(row[1])
		idx = row[0].find('[')
		if idx == -1:
			k = row[0]
		else:
			k = row[0][:idx] 

		a = loc_pin_dict.get(k, [])
		a.append(row[1])
		loc_pin_dict[k] = a

def find_pin_loc(pin):
	for k in loc_pin_dict:
		if pin in loc_pin_dict[k]:
			return k
	return None

@bottle.get('/')
def index():
	return template('main_template', loc_pin_dict=loc_pin_dict, pin_list=pin_list, loc=None, errors=None)
	

@bottle.post('/')
def index():
	errors = []
	loc = request.forms.get('loc')
	if loc == "":
		pin = request.forms.get('pin')
		if pin == "":
			errors.append("Please enter location or pin")
			loc = None
		else:
			loc = find_pin_loc(pin)
			if loc == None:
				errors.append("Pin not found")
	if loc is not None and loc not in loc_pin_dict:
		errors.append("Location not found")
		loc = None
	return template('main_template', loc_pin_dict=loc_pin_dict, pin_list=pin_list, loc=loc, errors=errors)

