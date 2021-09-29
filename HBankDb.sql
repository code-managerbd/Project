CREATE table Branch(
BranchCode int not null primary key identity,
[Name] nvarchar(40) not null,
District nvarchar(40) not null,
Address nvarchar(30) not null
)
Go
CREATE table PersonalInformation(
PersonalId int not null primary key identity,
[Name] nvarchar(40) not null,
--Nid bigint not null,
DoB datetime not null,
Address nvarchar(40) not null,
Phone nvarchar(40) not null,
Email nvarchar(40) null,
Photo Nvarchar(200) not null
)
Go
CREATE table AccountInformation(
AccountNo int not null identity primary key,
PersonalId int not null references PersonalInformation(PersonalId),
BranchCode int not null references Branch(BranchCode),
AccountType nvarchar(40) not null,
RegistrationDate datetime not null,
--ActivationDate datetime not null,
--InitialDeposit decimal not null default(500.00),
Balance decimal not null default(500.00)
)
Go
Create table [Deposit]
(
TransactionId int not null identity(10001,1) primary key,
AccountNo int not null references AccountInformation(AccountNo),
[Date] datetime not null,
Deposit decimal not null
)
Go
CREATE TRIGGER trDepositAccountBalanceUpdate ON  [Deposit]
after INSERT
AS
	--declare @n varchar(10);
	declare @accountNo int;
	declare @deposit decimal;
	select @accountNo= i.AccountNo from inserted i;
	select @deposit= i.Deposit from inserted i;

	update AccountInformation set Balance +=@deposit
	where AccountNo = @accountNo;
GO
Create table [Withdrawn]
(
TransactionId int not null identity(10001,1) primary key,
AccountNo int not null references AccountInformation(AccountNo),
[Date] datetime not null,
Withdrawn decimal not null
)
Go
CREATE TRIGGER trAccountBalanceUpdate ON  [Withdrawn]
after INSERT
AS
	--declare @n varchar(10);
	declare @accountNo int;
	declare @withdrawn decimal;	
	select @accountNo= i.AccountNo from inserted i;
	select @withdrawn= i.Withdrawn from inserted i;

	update AccountInformation set Balance -= @withdrawn
	where AccountNo = @accountNo;
GO