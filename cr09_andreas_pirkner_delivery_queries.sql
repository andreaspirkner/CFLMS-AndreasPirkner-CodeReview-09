/*All recipients by first and second name*/

select Recipient.First_Name,Recipient.Second_Name
from Recipient
/*-----------------------------------------------------*/

/*Select all Employees with the first name Max*/

select *
from Employee
where Employee.First_Name = "Max"
/*---------------------------------------*/

/*Show all Recipients with date received higher than 2020-02-04 10:28:31 */

select *
from Recipient
where Recipient.Date_Received > "2020-02-04 10:28:31"
/*------------------------------------------------------*/

/*Show all Senders with last name not beginning with B*/

select *
from Sender
where Sender.Second_Name not like "B%"

/*Which employee delivered to which recipient with address and time received*/

select *
from Employee
inner join Recipient on Recipient.Recipient_ID = Employee.Recipient_ID
/*-------------------------------------------------------------------------*/


/*Which mail item is delivered to which recipient?*/

select * from Mail
inner join Recipient on Recipient.Recipient_ID = Mail.Recipient_ID
/*----------------------------------------------------------------------*/

/*Which employee works at which location?*/

select * from Location
inner join Employee on Employee.Employee_ID = Location.Employee_ID
/*-----------------------------------------------------------------*/

/*Which sender sent which mail item?*/

select * from Sender
inner join Mail on Mail.Mail_ID = Sender.Mail_ID
/*--------------------------------------------------*/


