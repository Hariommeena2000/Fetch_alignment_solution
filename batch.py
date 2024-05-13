def read_assembly_code(file_path):
    with open(file_path, 'r') as file:
        return file.readlines()

def build_new_assembly_code(assembly_code_lines):
    new_code = []
    for i in range(0, len(assembly_code_lines), 4):
        batch = assembly_code_lines[i:i+4]
        if len(batch) == 4:
            target = batch[0]
            branch_condition = batch[-1]
            middle_instructions = batch[1:-1]
            new_batch = [target] + middle_instructions + [branch_condition]
            new_code.extend(new_batch)
            new_code.extend(['\n', '\n'])  # Add two blank lines after every batch
        else:
            new_code.extend(batch)
    return new_code

def write_new_assembly_code_to_file(new_code, file_path):
    with open(file_path, 'w') as file:
        for line in new_code:
            file.write(line)

# Main function to process the assembly code and output new assembly code
def main(input_file_path, output_file_path):
    assembly_code_lines = read_assembly_code(input_file_path)
    new_code = build_new_assembly_code(assembly_code_lines)
    write_new_assembly_code_to_file(new_code, output_file_path)

# Specify the path to your assembly code file and the output file
input_file_path = 'output.txt'  # Replace with your assembly code file path
output_file_path = 'new_assembly_code.txt'  # The output file path

# Run the main function
if __name__ == '__main__':
    main(input_file_path, output_file_path)
