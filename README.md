# luizfper.github.io

The idea of this webapp is to help the user go searching through thousands of job posts in indeed.com with better queries and keep track of different requests.

Hopefully, it will help short-list the postings that more closely suits the user, by removing the ones that doesn't conform to the stated requests.

I've requested access to the indeed API, but I don't know if I will be allowed to do this, hence i am preparing myself to scrape the website if i need to.

Views:
- signup: simple form for creating a customer's account. contains e-mail and password
- log in: simple log in form
- index: will show all user's requests and click on them
- request: show a request details and allow the user to click on job postings
- make request: starts a new request with several parameters

models:
- users: has password and e-mail (has_many requests, has_many job_postings through requests)
- request: has a user-id (belongs_to users, has_many job postings)
- job: has a request_id, title and content

controllers:
- appcontroller: overall handling of the application
- usercontroller: handles requests related to users
- requestcontroller:handles requests related to requests
- jobcontroller:handles requests related to jobs

Other things:

- I will try to get the website alive through github pages.
- if i have time, i'll try to use azure or google for the database


