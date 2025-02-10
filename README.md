There is a database that contains a website's traffic data over a period of 30 days. The first table contains users' information including the user type (user, crawler, admin). The second table consists of the time of each visit to the website, the id of the visitor, time spent on the website in seconds. Write an SQL query to show the 3 day moving average of time spent on the website for users.user_type = 'user'.

Note: avg time spent must have 4 decimal digits and rounded off (example: 5/3 = 1.6667, 5/2 = 2.5000 and 1/3 = 0.3333)

There are 2 tables: users, traffic

users

Name

id

Type

Description

INTEGER

The user's unique id. It is the primary key.

name

VARCHAR

This is the second column and the name of the user.

user_type

VARCHAR

Type of the user

traffic

Name

Type

Description

user_id

INTEGER

id of the user from the users table.

visited_on

DATE

date on which the user visited the website

time_spent

INTEGER

time spent on website in seconds
