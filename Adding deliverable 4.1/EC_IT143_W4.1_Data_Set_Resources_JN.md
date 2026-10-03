# EC IT143 - 4.1 Final Project: My Communities - Data Set Resources
**Author:** Josue Neiculeo

## Community 1: MyFC (Soccer Team Community)

**Description:** MyFC represents a youth/club soccer team community. The data set tracks the
people and structure of the team - the players, the teams they belong to, the positions they
play, and their monthly pay - which makes it a useful small example of a sports organization's
roster and payroll data.

**Data Set:** MyFC.zip, a SQL Server backup (.bak) containing team, player, and position roster
data for a youth soccer organization.

**Source:** Provided as a course example data set for EC IT143 (MyFC.zip), supplied directly by
the instructor rather than hosted on a public site, so no external link is available.

**Tables (joinable):**
| Table | Fields |
|---|---|
| dbo.tblTeamDim | t_id, t_code |
| dbo.tblPositionDim | p_id, p_code, p_name, p_target |
| dbo.tblPlayerDim | pl_id, l_name, f_name, pl_name, t_id, p_id, pl_num |
| dbo.tblPlayerFact | as_of_date, pl_id, mtd_salary |

tblPlayerDim joins to tblTeamDim on t_id and to tblPositionDim on p_id; tblPlayerFact joins to
tblPlayerDim on pl_id.

---

## Community 2: Simpsons (Household Finance Community)

**Description:** This community represents a household/family unit and its day-to-day finances.
The data set tracks family members, their job/department information, and their credit card
transactions across two different accounts, making it a simple example of personal finance and
spending-pattern data.

**Data Set:** Simpsons.zip, a set of flat files (.csv/.txt) containing family member records and
two separate credit card transaction logs.

**Source:** Provided as a course example data set for EC IT143 (Simpsons.zip), supplied directly
by the instructor rather than hosted on a public site, so no external link is available.

**Tables (joinable):**
| Table | Fields |
|---|---|
| dbo.Family_Data | Member_ID, Name, First_Name, Middle_Name, Last_Name, Job_Title, Status, Hire_Date, Termination_Date, Department_Code, Department, Home_Address, Birth_Date, Manager |
| dbo.FBS_Viza_Costmo | Status, Date, Description, Debit, Credit, Member_Name |
| dbo.Planet_Express | Date, Description, Card_Member, Account, Amount, Category |

FBS_Viza_Costmo joins to Family_Data on Member_Name = Name; Planet_Express joins to Family_Data
on Card_Member = Name (case-insensitive match required, since Card_Member is stored in all caps).
