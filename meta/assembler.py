infile = open('test.asm')
ofile = open('programrom.v', 'w')

def output(*args, **kwargs):
	print(*args, file = ofile, **kwargs)

sources = {
	'R': 0,
	'Stack': 1,
	'SP': 2,
}
dest_options = {
	'BLANK': 0,
	'T': 1,
	'R': 2,
	'Stack': 4,
}
jsources = {
	'ALU': 0,
	'R': 1,
	'T': 2,
	'Stack': 3
}

labels = {}

inst_no = 0
for line_no, line in enumerate(infile):
	line, *_ = line.partition(';')  # comment support
	label, _, stmt = line.rpartition(':')  # label support

	if label: labels[label] = inst_no
	if not stmt: continue
	inst_no += 1

print('Completed pass 1')
infile.seek(0)

output(f'''module programrom(input [0:15] i_addr, output [0:17] o_instr);
wire [0:17] program [0:{inst_no}];
''')

inst_no = 0
for line_no, line in enumerate(infile):
	line, *_ = line.partition(';')  # comment support
	label, _, stmt = line.rpartition(':')  # label support

	if not stmt.strip(): continue

	split = stmt.split()

	if split[0] == 'DT':
		if split[1].startswith('0x'): val = int(split[1], 16)
		elif split[1].isidentifier(): val = labels[split[1]]
		else: val = int(split[1])
		val &= 65535  # DT should not leak into MV and OP
		output(f"assign program[{inst_no}] = 18'b{val:018b}; //", line.strip())
		inst_no += 1
		continue

	inst, _, jump = stmt.partition(',')
	split = inst.split()

	if   split[0].endswith('+'): split[0] = split[0][:-1]; sp = 0b01
	elif split[0].endswith('-'): split[0] = split[0][:-1]; sp = 0b10
	else: sp = 0b11

	if   split[0].endswith('I'): split[0] = split[0][:-1]; idx = 1
	else: idx = 0

	if split[0] == 'OP':
		if split[1].startswith('0x'): val = int(split[1], 16)
		else: val = int(split[1])
		val &= 31
		itype = 1

	elif split[0] == 'MV':
		src = sources[split[1]]
		dests = [dest_options[dest] for dest in [*split, 'BLANK', 'BLANK', 'BLANK'][2:5]]
		val = (src<<3)|dests[0]|dests[1]|dests[2]
		itype = 0
	else:
		print('Syntax error:')
		print(' ', line)
		quit(1)

	if not jump: jval = 0; jsrc = 0
	else:
		split = jump.split()
		jsrc = jsources[split[1]]
		if split[1].startswith('0x'): jval = int(split[1], 16)
		else: jval = int(split[1])
		jval &= 63

	output(f"assign program[{inst_no}] = 18'b{sp:02b}{itype}{val:05b}{idx}{jsrc:03b}{jval:06b}; //", line.strip())

	inst_no += 1

print(f'Completed pass 2: Read {line_no} lines')

output('assign o_instr = program[i_addr];')
output('endmodule')
