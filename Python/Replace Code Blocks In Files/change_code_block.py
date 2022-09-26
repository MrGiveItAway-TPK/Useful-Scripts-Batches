import re

replace_from="#start calculator"
replace_to="#end calculator"

original_code = open('original_code.py').read()
replacement_code = open('replacement_code.py').read()

re_sub_string=r"(?:^|\n)([\t ]*?)" + replace_from + r"[\s\S]*?\n\1" + replace_to

final_output = re.sub(re_sub_string,replacement_code,original_code)

print("Original Code:\n\n",original_code,"\n\n")
print("Replacement Code:\n\n",replacement_code,"\n\n")
print("Final Output:\n\n",final_output,"\n\n")

with open('final_output.py', 'w') as filetowrite:
    filetowrite.write(final_output)