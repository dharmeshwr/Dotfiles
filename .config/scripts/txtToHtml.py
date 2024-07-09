# Function to convert cleaned text back to HTML body content
def convert_to_html(cleaned_text):
    # Split the cleaned text by newline characters
    lines = cleaned_text.splitlines()
    
    # Join lines with <br> tags
    body_content = '<br />\n'.join(lines)
    
    # Wrap in <body> tags
    html_content = f'<html contenteditable="true" >\n<body>\n{body_content}\n</body>\n</html>'
    
    return html_content

# Read cleaned content from the text file
input_file = 'task.txt'
with open(input_file, 'r', encoding='utf-8') as f:
    cleaned_text = f.read()

# Convert cleaned text to HTML body content
html_body_content = convert_to_html(cleaned_text)

# Write the HTML body content back to a new HTML file
output_file = './task.html'
with open(output_file, 'w', encoding='utf-8') as f:
    f.write(html_body_content)

print('brooo')

