# README

# Seeded User Credentials
admin email: admin@tsys.com <br />
admin password: 1qazxsw2 <br />
<br/>
recruiter email: recruiter@tsys.com <br/>
recruiter password: pass <br/>
<br/>
job seeker email: job_seeker@tsys.com <br/>
job seeker password: pass <br/>
<br/>
account with both roles email: both@tsys.com <br/>
account with both roles password: pass <br/>
<br/>
<br/>

# How to navigate
Begin by either logging in, or signing up as a new user.
If you login as a returning user you will be brought to the homepage. If you sign up as a new user, you will be brought to the user edit page. From here you can update the information for your profile that was not required during sign up. <br />
The home page will link you to the main functionalities depending on what roles you have, and which role you are currently viewing the website as. Accessing the systems functionality is best done via the homepage. From here you will be able to see all companies, jobs, and applications.

# Users
In your profile there is a record of your information, including email, name, and phone number. As a recruiter or job seeker you do not have access to view other users information, as an admin however you can see all users information except for passwords. All users are able to edit their own profiles, and admins have the ability to edit another users profile.<br/>Recruiters who have signed up must navigate to their profile, and edit it to include a company before they can begin posting jobs. Recruiters have the option to either choose from an existing company, or to create a new company.<br/>If you are signed in as a user with multiple roles you will see radio buttons in the lower left portion of your web browser. When you select one of the options you will be viewing the system with the permissions of that role. If you are a recruiter or job seeker and wish to add the opposite role to your account, logout of your account. Select the sign up option, use the same username and password as your current account, and change the role drop down to reflect the role you would like to add.

# Jobs
When you navigate to the jobs index you will be able to view the list of all available jobs. Job seekers can select the show button on any job in the index, and then apply to the position with the apply link.<br />Recruiters can create new jobs from the index by selecting the New Job link. The new job will automatically be linked to the company that the recruiter added to their profile.<br />All users will have access to the jobs filtering tool. There are multiple search bars above to the jobs table that allow you to filter based on the attributes of a job.<br />If you are a recruiter and you have job(s) open, and either you or and admin update the current company in your profile, all of your open jobs will be delete, and the applications that are linked to that job will be set to "Position closed". This will also occur if you or the admin delete your account.

# Companies
All user types have access to view the index of companies, but only recruiters and admins can create new companies. This can be performed by both via the link in the companies index, and recruiters also have the option to create a new company while editing their profile. When a recruiter chooses to create a new company from either link the company will automatically be made the company they are working for. From the companies index you can either click on the company name or on the show links to access company information. There is also a link for "View all jobs by #company" which will bring you to the jobs index filtered by company name.<br/>When a company is deleted the linked recruiters will be left without a company and must go through the process of adding a company again. The jobs that were linked to the company will also be deleted, and the applications for those positions will be closed.

# Applications
As a job seeker you apply to open positions by navigating to the job you wish to apply for, clicking the show link, and then clicking apply. After filling out the form and uploading your resume the application will be created. A job seeker can go back to view their submitted applications via the applications index.<br/>Recruiter can use the application index to view all the current applications to positions within their company. Recruiter may only edit the applications that are submitted to jobs that they have created. To change the status of an application, recruiters must navigate to the edit link and change the drop down field from there.

# Setting up rats on your local machine
RATS uses postgreSQL for it db system. If you run into any errors installing/running the system on your local machine we recommend dropping your development tables to set up a new local instance. <br />
Perform a DB drop, run rake db:create, then rake db:migrate, and finally db:seed.
