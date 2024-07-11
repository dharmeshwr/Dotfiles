from bs4 import BeautifulSoup

def clean_html_body(html_content):

    soup = BeautifulSoup(html_content, 'html.parser')
    
    body_content = soup.body.get_text(separator='\n', strip=True)
    
    body_content = body_content.replace('<br>', '\n').replace('<div>', '\n').replace('</div>', '')
    
    return body_content

html_file = 'task.html'
with open(html_file, 'r', encoding='utf-8') as f:
    html_content = f.read()

cleaned_content = clean_html_body(html_content)

output_file = './task.txt'
with open(output_file, 'w', encoding='utf-8') as f:
    f.write(cleaned_content)

print('Keep Rocking')

