# Tracks various level xpaths. Create a folder in future if the number of xpaths grows.
# Selenium Test Xpath Variables
robot_check_id = 'xpath=//*[@class="title"]'
robot_loc_value_id = '//*[@id="introduction"]//following::p[1]'

# SSO login
CustomerCode_sso_textbox = 'id:customer_code'
username_sso_textbox = 'id:user_name'
password_sso_textbox = 'id:password'
login_sso_button = "//button[text()='LOGIN']"


# Symphony Job List
Draganddrop_Element = "//div[@aria-label='Drag & Drop']"
Temp_list="//h3[text()='Template List']"
Temp_Btn="//input[@type='radio']"
Temp_View="(//button[contains(@class,'MuiButtonBase-root MuiIconButton-root')]/following-sibling::button)[1]"
# Temp_Active="//li[text()='Active']"
Job_Cancel="xpath://button[@aria-label='close']"

# arrow="xpath://div[contains(@class,'jss4416 MuiBox-root')]"
Fastrack="xpath://span[normalize-space()='Fastrack']"
Fastrack_service="//h3[text()='Fastrack Services']"
AddNewItem = "(//button[contains(@class,'MuiButtonBase-root MuiButton-root')])[2]"
Temp_Name="(//button[@type='button'])[3]"
Text_field="//button[@title='Text Field']"
placehold_Text="//input[@id='placeholderText']"
Gv_Click="//span[text()='Global Variable']"
delayOne="//span[text()='delayone']"
saveGv="(//span[text()='Save'])[2]"
service_Item="//p[text()='080320231103']"
fas_dropdown="(//button[contains(@class,'MuiButtonBase-root MuiButton-root')]/following-sibling::button)[2]"
drop_Fname="id:fieldName"
drop_Lname="id:labelOption"
drop_value="id:valueOption"
addDropdown="//span[text()='Add']"
fas_number="(//button[contains(@class,'MuiButtonBase-root MuiButton-root')]/following-sibling::button)[3]"
number_Fname="id:fieldName"
number_phtext="id:placeholderText"
fas_date="(//button[contains(@class,'MuiButtonBase-root MuiButton-root')]/following-sibling::button)[4]"
fas_checkbox="(//button[contains(@class,'MuiButtonBase-root MuiButton-root')]/following-sibling::button)[5]"
fas_radiobutton="(//button[contains(@class,'MuiButtonBase-root MuiButton-root')]/following-sibling::button)[6]"
discord="//span[text()='Discard']"
deletecatalogue="//span[text()=' Delete Catalogue']"
deleteconfirm="(//div[@class='MuiDialogActions-root MuiDialogActions-spacing']//button)[2]"
publishCatalogue="//span[text()=' Publish as Catalogue']"

# Delay="xpath:(//div[@class='ports'])[2]"
scroll="//span[text()='27']"
AvailSetname="xpath:(//div[contains(@class,'MuiAccordionSummary-content jss1254')])[2]"
Tags="xpath:(//div[contains(@class,'MuiAccordionSummary-content jss1254')])[3]"
Backup="xpath:(//div[contains(@class,'MuiButtonBase-root MuiAccordionSummary-root')])[2]"
vmtag="xpath:/html/body/div[2]/div[3]/div/div[3]/div/div[4]/div[1]/div[1]"
Discname="xpath:(//div[contains(@class,'MuiButtonBase-root MuiAccordionSummary-root')])[3]"
SysIdentity="xpath:/html/body/div[2]/div[3]/div/div[3]/div/div[5]/div[1]/div[1]"
Globalvariable='xpath:/html/body/div[2]/div[3]/div/div[3]/div/div[6]/div[1]/div[1]'
maintanancemode="xpath:/html/body/div[2]/div[3]/div[2]/div[3]/div/div[7]/div[1]/div[1]"
vmother="xpath:/html/body/div[2]/div[3]/div/div[3]/div/div[8]/div[1]/div[1]"
Tile9="xpath:/html/body/div[2]/div[3]/div[2]/div[3]/div/div[9]/div[1]"
Tile10="xpath:/html/body/div[2]/div[3]/div[2]/div[3]/div/div[10]/div[1]"
plusAdd="//button[@aria-label='Add']"
varKey='xpath://*[@id="variableKey"]'
varValue='xpath://*[@id="variableValue"]'
addTick="xpath://button[@aria-label='Save']"
addvault="xpath://button[@title='Add Vault Variable']"
InputTempone="xpath:(//input[contains(@class,'MuiInputBase-input MuiOutlinedInput-input')])[1]"
InputTemptwo="xpath:(//input[contains(@class,'MuiInputBase-input MuiOutlinedInput-input')])[2]"
InputTempthree="xpath:(//input[contains(@class,'MuiInputBase-input MuiOutlinedInput-input')])[3]"
InputTempfour="xpath:(//input[contains(@class,'MuiInputBase-input MuiOutlinedInput-input')])[4]"
InputDomain="id:faultDomain"
Inputupdate="id:updateDomain"
classic="xpath://li[@data-value='Classic']"
fieldtype="id:fieldType"
gv="xpath://li[text()='Global Variables']"
tagname="id:tagName"
tagvalue="id:tagValue"

# Template Tiles
Tile1 = "xpath:(//div[contains(@class,'MuiButtonBase-root MuiAccordionSummary-root')])[1]"
Tile2 = "xpath:(//div[contains(@class,'MuiButtonBase-root MuiAccordionSummary-root')])[2]"
Tile3 = "xpath:(//div[contains(@class,'MuiButtonBase-root MuiAccordionSummary-root')])[3]"
Tile4 = "xpath:(//div[contains(@class,'MuiButtonBase-root MuiAccordionSummary-root')])[4]"
Tile5 = "xpath:(//div[contains(@class,'MuiButtonBase-root MuiAccordionSummary-root')])[5]"
Tile6 = "xpath:(//div[contains(@class,'MuiButtonBase-root MuiAccordionSummary-root')])[6]"
Tile7 = "xpath:(//div[contains(@class,'MuiButtonBase-root MuiAccordionSummary-root')])[7]"
Tile8 = "xpath:(//div[contains(@class,'MuiButtonBase-root MuiAccordionSummary-root')])[8]"
Tile9 = "xpath:(//div[contains(@class,'MuiButtonBase-root MuiAccordionSummary-root')])[9]"
Tile10 = "xpath:(//div[contains(@class,'MuiButtonBase-root MuiAccordionSummary-root')])[10]"
Job_Cancel="//button[@aria-label='close']"

# User Administration
Expand_Dashboard = "//div[contains(@class,'jss340 MuiBox-root')]"
Click_User_Tab = "//div[@aria-label='Users']"
Add_User = "(//button[contains(@class,'MuiButtonBase-root MuiFab-root')])[1]"
Add_First_Name = "//input[@id='first_name']"
Add_Last_Name = "//input[@id='last_name']"
Add_Email = "//input[@id='email_id']"
Add_User_Name = "//input[@id='user_name']"
Add_Expiry_Date = "//input[@id='userExpiryDate']"
Add_Cloud_Platform = "//div[@id='cloudPlatforms']"
Click_GCP = "//li[@data-value='GCP']"
Azure_Platform = "//li[@data-value='AZURE']"
Aws_Platform = "//li[@data-value='AWS']"
Onpremise_Platform = "//li[@data-value='ONPREMISE']"
IBM_Platform = "//li[@data-value='IBM']"
Provide_Password = "//input[@id='resetPassword']"
Back_Ground_User = "(//div[contains(@class,'MuiGrid-root MuiGrid-item')]//label)[2]"
User_Role = "//li[@data-value='jobs']"
Next_Button = "//button[text()='Next']"
Profile = "(//div[text()='R'])[1]"
Add_Credentials = "(//button[contains(@class,'MuiButtonBase-root MuiFab-root')])[1]"
Access_Key = "(//input[@type='password'])[1]"
Secret_Key = "(//input[@type='password'])[2]"
Account_ID = "//input[@id='awsAid']"
AWS_IAM = "//input[@id='awsIam']"
Skip_Credentials = "//button[text()='Skip']"
Save_Credentials = "//button[text()='Save']"
Back_to_Page = "xpath:(//div[contains(@class,'MuiBackdrop-root MuiBackdrop-invisible')])[3]"
Integration_Tpye = '//*[@id="integrationTypes"]'
Select_Fresh_Service = "//li[@data-value='freshservice']"
Select_Service_Now = "//li[@data-value='servicenow']"
Select_Topdesk = "//li[@data-value='topdesk']"

# Azure creddentials
Azure_Client_ID = "(//input[@id='azureClientId'])"
Az_Client_Secret = "(//input[@id='azureSecret'])"
Az_Domain = "(//input[@id='azureDomain'])"
AZ_Storage_String = "(//input[@id='azureStorageString'])"
Load_Subscription = "//button[text()='load subscriptions']"

#GCP cretencials
Account_Type = "(//input[@id='type'])"
Project_ID = "(//input[@id='project_id'])"
Private_Key_ID = "(//input[@id='private_key_id'])"
Private_Key = "(//input[@id='private_key'])"
GCP_Email = "(//input[@id='client_email'])"
GCP_Client_ID = "(//input[@id='client_id'])"
GCP_Auth_URL = "(//input[@id='auth_uri'])"
GCP_Token_URL = "(//input[@id='token_uri'])"
CGP_Auth_cert_URL = "//input[@id='auth_provider_x509_cert_url']"
GCP_Client_Cert_URL = "//input[@id='client_x509_cert_url']"


#IBM credentials
IBM_API_Key = "(//input[@id='api_key'])"
IBM_Account_ID = "(//input[@id='account_id'])"
Power_IBM = "//p[text()='IS POWER IBM ENABLED']"
Select_Yes = "//li[@data-value='Yes']"
Select_No = "//li[@data-value='No']"
Finish_Button = "//button[text()='Finish']"
Cancel_button = "//button[text()='Cancel']"
Search_Tag = "//input[@placeholder='Search...']"
Delete_button = "(//button[@type='button'])[14]"
Click_OK = "//button[text()='Ok']"
View_button = "(//button[@type='button'])[12]"
Edit_button = "(//button[@type='button'])[13]"
Reset_Password = "(//input[@name='isResetPassword'])[1]"

# Web_API
drag_drop = "//div[@aria-label='Drag & Drop']"
Templatelist = "//h3[text()='Template List']"
globalSearch = "id:globalSearch"
TempRadio_Btn = "//input[@type='radio']"
TempEye_Icon = "xpath://button[@aria-label='View Template']"
Temp_Active = "xpath://li[text()='Active']"
Execute_Btn = "//button[text()='Execute']"
JobName = "id:job_title"
SelectOwner = "xpath:(//input[@role='combobox'])[1]"
Email_Notify = "id:switch"
File_Format="(//input[@id='switch'])[2]"
Execute_Job="(//button[text()='Execute'])[2]"
Search_JobName="id:search"
Job_Checkbox="(//input[@type='checkbox'])[2]"
DripleDot='xpath://*[@id="root"]/div/div/div/div/main/div[3]/div[3]/div[4]/div[1]/div/table/tbody/tr[2]/td[12]/div/button'
ProcessFlow="//button[@aria-label='Process Flow']"
RefreshBtn="//button[@aria-label='Right-click to auto-refresh']"
MainWindow="//main[contains(@class,'jss57 MuiBox-root')]"


Vault = "//div[@aria-label='Vaults']"
Password_Vault = "//h3[text()='Password Vault']/following-sibling::p"
Comb_box = "//div[@role='combobox']"
own_vault  = "//li[text()='Own Vault']"
Add_vault = "//button[text()='Add Vault']"
Add_Vault_Key = 'xpath://*[@id="root"]/div/div/div/div/main/div[2]/div[1]/div/div/div[5]/button'
Edit_Vault = "(//td[contains(@class,'MuiTableCell-root MuiTableCell-body')]//button)[3]"
Save_button = "xpath://button[text()='Save']"
update_vault = "//button[text()='Update']"
Check_log = "(//td[contains(@class,'MuiTableCell-root MuiTableCell-body')]//button)[1]"



GV_Node ="xpath:(//div[@data-nodeid='26a1fb51-3b5e-4a47-838b-01538d4e6cc1'])[1]"
SecondTile = "xpath:(//div[contains(@class,'MuiButtonBase-root MuiAccordionSummary-root')])[2]"
ThirdTile = "xpath:(//div[contains(@class,'MuiButtonBase-root MuiAccordionSummary-root')])[3]"
FourthTile = "xpath:(//div[contains(@class,'MuiButtonBase-root MuiAccordionSummary-root')])[4]"
FifthTile = "xpath:(//div[contains(@class,'MuiButtonBase-root MuiAccordionSummary-root')])[5]"
NodeClose = "//button[@aria-label='close']"
ClusterStatus_Node = "xpath:(//div[@data-nodeid='50bb7554-abf6-451e-bbb2-5fc1644b691d'])[1]"
EnableMaintanance_Node = "(//div[@data-nodeid='ab95faf7-4406-4fbc-8f44-c8932034b44b'])[1]"
sapcontrolService_Node = "(//div[@data-nodeid='d2b931cf-a974-48bd-bda4-f749015ae681'])[1]"
Delay1="(//div[@data-nodeid='55529963-a615-4fa6-824a-337041f43eb4'])[1]"
sapcontrolService_Node2="(//div[@data-nodeid='d6698227-56e4-4317-829a-c0702c1e56da'])[1]"
Delay2="(//div[@data-nodeid='8ff709f8-98d0-43ba-9e20-2676112978a6'])[1]"
sapcontrolService_Node3="(//div[@data-nodeid='7891570e-4d73-4f8c-a2e8-1e5638f71ca3'])[1]"
Delay3="(//div[@data-nodeid='a605a13b-2eb5-447f-bc52-487759897f1c'])[1]"
sapcontrolService_Node4="(//div[@data-nodeid='d080ab1c-33b4-4c7d-bfe8-b4f7236b1bdd'])[1]"
Delay4="(//div[@data-nodeid='8ff709f8-98d0-43ba-9e20-2676112978a6'])[1]"
StopVmErs="(//div[@data-nodeid='08af016e-c868-4471-83ec-c341c0463228'])[1]"
StopVmascs="(//div[@data-nodeid='4e0da622-8fa3-4c34-b555-edb3352f15a0'])[1]"
Delay5 ="(//div[@data-nodeid='8c258fea-e5ca-4c1c-a89b-7de8bd58b939'])[1]"
