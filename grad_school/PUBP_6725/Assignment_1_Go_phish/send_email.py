# using SendGrid's Python Library
# https://github.com/sendgrid/sendgrid-python
import os
from sendgrid import SendGridAPIClient
from sendgrid.helpers.mail import Mail

html_content = open('email.html', 'r').read()
message = Mail(
    from_email=('no-reply@citi-program.org', 'CITI Program'),
    to_emails='nroth31@gatech.edu',
    subject='CITI Program - Your Certification is Expired',
    html_content=html_content)
try:
    sg = SendGridAPIClient(os.environ.get('SENDGRID_API_KEY'))
    response = sg.send(message)
    print(response.status_code)
    print(response.body)
    print(response.headers)
except Exception as e:
    print(e.message)