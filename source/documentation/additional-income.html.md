---
title: Additional Income | Income Tax (MTD) End-to-End Service Guide
weight: 30
description: Software developers, designers, product owners or business analysts. Integrate your software with the Income Tax API for Making Tax Digital.
---

# Additional Income

## Employments

This suite of endpoints display the PAYE information returned to HMRC by a user’s employers.

The user will be able to add to or supply different employment data after the tax year has ended.  This can include details of missing employments, or financial data.  In addition, the user can choose to ignore the data HMRC holds, for the purpose of their self-assessment calculation.

These endpoints can be broken into three categories:

* details of the employment  
* financial data and benefits from a specific employment
* employment expenses from all of the user’s employments


[Add a Custom Employment](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1{nino}~1{taxYear}/post)

[Amend a Custom Employment](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1{nino}~1{taxYear}~1{employmentId}/put)

[Retrieve an Employment](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D/get)

[List Employments](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1%7Bnino%7D~1%7BtaxYear%7D/get)

[Delete a Custom Employment](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D/delete)

[Ignore an Employment](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D~1ignore/post)

[Unignore an Employment](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D~1unignore/post)

[Create and Amend Employment Financial Details](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D~1financial-details/put)

[Retrieve an Employment and its Financial Details](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D~1financial-details/get)

[Delete Employment Financial Details](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D~1financial-details/delete)

[Create and Amend Employment Expenses](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-expenses-api/1.0#Create%20and%20Amend%20Employment%20Expenses)

[Retrieve Employment Expenses](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-expenses-api/1.0#Retrieve%20Employment%20Expenses)

[Delete Employment Expenses](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-expenses-api/1.0#Delete%20Employment%20Expenses)

[Ignore Employment Expenses](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-expenses-api/1.0#Ignore%20Employment%20Expenses)
HMRC will pre-populate the employment information provided by employers. The user should check and correct the information, as necessary, prior to final declaration.

**Note:**

Pre-populated data can only be stopped (ignored) from being used in any tax calculation.

User-generated content:

* can be deleted
* will only be applied in the tax calculation
* will not overwrite pre-populated data

Custom employments will only apply to the tax year and will not be carried over in subsequent years.  The expenses values are summed values from all PAYE employments, they are not available by employment.


## Other Employment Income

These endpoints allow a user to create, amend, retrieve and delete other employment income: Share options, Shares awarded or received, Lump sums, Disability and Foreign service.

* [Retrieve Other Employment Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0#Retrieve%20Other%20Employment%20Income)
* [Create and Amend Other Employment Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0#Create%20and%20Amend%20Other%20Employment%20Income)
* [Delete Other Employment Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0#Delete%20Other%20Employment%20Income)


<a href="figures/other-employment-income.svg" target="blank">
<img src="figures/other-employment-income.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/other-employment-income.svg" target="blank">Open diagram in a new tab.</a>

## Dividends Income

These endpoints allow a user to create, retrieve, amend and delete dividends income: foreign dividend, dividend income received whilst abroad, stock dividend, redeemable shares, bonus issues of securities and close company loans written off.

* [Retrieve Dividends Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0#Retrieve%20Dividends%20Income)
* [Create and Amend Dividends Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0#Create%20and%20Amend%20Dividends%20Income)
* [Delete Dividends Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0#Delete%20Dividends%20Income)

<a href="figures/dividends-income.svg" target="blank">
<img src="figures/dividends-income.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/dividends-income.svg" target="blank">Open diagram in a new tab.</a>

## Foreign Income

These endpoints give a user the ability to manage their data related to foreign earnings and unremittable foreign income.

The user can submit details of their foreign earnings and foreign income for a specific tax year, as well as amend submissions already made.  They also have the option to delete previous submissions and to retrieve the information they have previously submitted.

* [Retrieve Foreign Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0#Retrieve%20Foreign%20Income)
* [Create and Amend Foreign Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0#Create%20and%20Amend%20Foreign%20Income)
* [Delete Foreign Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0#Delete%20Foreign%20Income)

<a href="figures/foreign-income.svg" target="blank">
<img src="figures/foreign-income.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/foreign-income.svg" target="blank">Open diagram in a new tab.</a>

## Insurance Policies Income

These endpoints allow a user to create, retrieve, amend and delete insurance policies and income for less common types of income: Life Insurance Policies, Life Annuity Contracts, Capital Redemption Policies, Voided ISAs, and Foreign Policies.

* [Retrieve Insurance Policies Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0#Retrieve%20Insurance%20Policies%20Income)
* [Create and Amend Insurance Policies Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0#insurance-policies-income_amend-insurance-policies-income-test-only_put_accordion)
* [Delete Insurance Policies Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0#insurance-policies-income_delete-insurance-policies-income-test-only_delete_accordion)

<a href="figures/insurance-policies-income.svg" target="blank">
<img src="figures/insurance-policies-income.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/insurance-policies-income.svg" target="blank">Open diagram in a new tab.</a>

## Pensions Income

These endpoints allow a user to create, retrieve, amend and delete previously populated foreign pensions and overseas pension contributions.

* [Retrieve Pensions Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0#pensions-income_retrieve-pensions-income-test-only_get_accordion)
* [Create and Amend Pensions Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0#pensions-income_amend-pensions-income-test-only_put_accordion)
* [Delete Pensions Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0#pensions-income_delete-pensions-income-test-only_delete_accordion)

<a href="figures/pensions-income.svg" target="blank">
<img src="figures/pensions-income.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/pensions-income.svg" target="blank">Open diagram in a new tab.</a>

## Other Income

These endpoints allow a user to create, retrieve, amend and delete other income: business receipts, all other income received whilst abroad, overseas income and gains, chargeable foreign benefits and gifts and omitted foreign income.

* [Retrieve Other Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0#pensions-income_retrieve-pensions-income-test-only_get_accordion)
* [Create and Amend Other Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0#pensions-income_amend-pensions-income-test-only_put_accordion)
* [Delete Other Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0#pensions-income_delete-pensions-income-test-only_delete_accordion)

<a href="figures/other-income.svg" target="blank">
<img src="figures/other-income.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/other-income.svg" target="blank">Open diagram in a new tab.</a>

## Savings Income

These endpoints allow a user to create, retrieve, amend and delete savings income for securities or foreign interest.

* [Retrieve Savings Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0#savings-income_retrieve-savings-income-test-only_get_accordion)
* [Create and Amend Savings Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0#savings-income_amend-savings-income-test-only_put_accordion)
* [Delete Savings Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0#savings-income_delete-savings-income-test-only_delete_accordion)

<a href="figures/savings-income.svg" target="blank">
<img src="figures/savings-income.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/savings-income.svg" target="blank">Open diagram in a new tab.</a>

## Savings Accounts

These endpoints allow a user to retrieve and maintain information about an individual's UK savings account.

* [List All UK Savings Accounts](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0#List%20All%20UK%20Savings%20Accounts%20[test%20only])
* [Add A UK Savings Account](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0#Add%20a%20UK%20Savings%20Account%20[test%20only])
* [Retrieve UK Savings Account Annual Summary](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0#Retrieve%20UK%20Savings%20Account%20Annual%20Summary%20[test%20only])
* [Create and Amend a UK Savings Account Annual Summary](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0#Create%20and%20Amend%20a%20UK%20Savings%20Account%20Annual%20Summary%20[test%20only])

<a href="figures/savings-accounts.svg" target="blank">
<img src="figures/savings-accounts.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/savings-accounts.svg" target="blank">Open diagram in a new tab.</a>

## Disclosures

These endpoints allow the user to manage their data related to the disclosure of tax avoidance schemes and undeclared income, for a given tax year.

The user can submit details of any disclosures for a specific tax year, as well as amend submissions already made.  They also have the option to delete previous submissions and to retrieve the information they have previously submitted.

The user would normally call this when they have all the information necessary for disclosures for the tax year.

* [Retrieve Disclosures](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-disclosures-api/1.0#disclosures_retrieve-disclosures-test-only_get_accordion)
* [Create and Amend Disclosures](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-disclosures-api/1.0#disclosures_amend-disclosures-test-only_put_accordion)
* [Delete Disclosures](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-disclosures-api/1.0#disclosures_delete-disclosures-test-only_delete_accordion)

<a href="figures/disclosures.svg" target="blank">
<img src="figures/disclosures.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/disclosures.svg" target="blank">Open diagram in a new tab.</a>

## Pension Charges

These endpoints allow a user to manage data related to pension contributions and charges. The user can submit details of pension contributions and charges for a specific tax year, as well as amend submissions already made. The user also has the option to delete previous submissions, and to retrieve the information they have previously submitted.

* [Retrieve Pension Charges](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-charges-api/1.0#_retrieve-pension-charges_get_accordion)
* [Create and Amend Pension Charges](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-charges-api/1.0#_amend-pension-charges_put_accordion)
* [Delete Pension Charges](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-charges-api/1.0#_delete-pension-charges_delete_accordion)

<a href="figures/pension-charges.svg" target="blank">
<img src="figures/pension-charges.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/pension-charges.svg" target="blank">Open diagram in a new tab.</a>




## Individual Reliefs

### Pensions Reliefs

These endpoints give the user the ability to manage data related to reliefs on pensions.  The user can submit details of reliefs on pensions for a specific tax year, as well as amend submissions already made.  They also have the option to delete previous submissions, and to retrieve the information they have previously submitted.

* [Retrieve Pensions Reliefs](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-reliefs-api/1.0#pensions-reliefs_retrieve-pensions-reliefs-test-only_get_accordion)
* [Create and Amend Pensions Reliefs](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-reliefs-api/1.0#pensions-reliefs_amend-pensions-reliefs-test-only_put_accordion)
* [Delete Pensions Reliefs](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-reliefs-api/1.0#pensions-reliefs_delete-pensions-reliefs-test-only_delete_accordion)

<a href="figures/pension-reliefs.svg" target="blank">
<img src="figures/pension-reliefs.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/pension-reliefs.svg" target="blank">Open diagram in a new tab.</a>

### Relief Investments

These endpoints allow a user to create, amend, delete and retrieve relief investments from VCT subscriptions, EIS subscriptions, Community Investments, Seed Enterprise Investments and Social Enterprise Investments.

* [Retrieve Relief Investments](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-reliefs-api/1.0#relief-investments_retrieve-relief-investments-test-only_get_accordion)
* [Create and Amend Relief Investments](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-reliefs-api/1.0#relief-investments_amend-relief-investments-test-only_put_accordion)
* [Delete Relief Investments](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-reliefs-api/1.0#relief-investments_delete-relief-investments-test-only_delete_accordion)

<a href="figures/relief-investments.svg" target="blank">
<img src="figures/relief-investments.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/relief-investments.svg" target="blank">Open diagram in a new tab.</a>


### Other Reliefs

These endpoints allow a user to create, amend, retrieve and delete reliefs other than investments that have previously been submitted.  This includes loan interest, payroll giving, shares and securities redemptions, maintenance payments, post-cessation reliefs, annual payments and qualifying loan interest payments.

* [Retrieve Other Reliefs](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-reliefs-api/1.0#other-reliefs_retrieve-other-reliefs-test-only_get_accordion)
* [Create and Amend Other Reliefs](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-reliefs-api/1.0#other-reliefs_amend-other-reliefs-test-only_put_accordion)
* [Delete Other Reliefs](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-reliefs-api/1.0#other-reliefs_delete-other-reliefs-test-only_delete_accordion)

<a href="figures/other-reliefs.svg" target="blank">
<img src="figures/other-reliefs.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/other-reliefs.svg" target="blank">Open diagram in a new tab.</a>


### Foreign Reliefs

These endpoints allow a user to create, retrieve, amend, and delete foreign reliefs that have been previously submitted.

* [Retrieve Foreign Reliefs](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-reliefs-api/1.0#foreign-reliefs_retrieve-foreign-reliefs-test-only_get_accordion)
* [Create and Amend Foreign Reliefs](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-reliefs-api/1.0#foreign-reliefs_amend-foreign-reliefs-test-only_put_accordion)
* [Delete Foreign Reliefs](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-reliefs-api/1.0#foreign-reliefs_delete-foreign-reliefs-test-only_delete_accordion)

<a href="figures/foreign-reliefs.svg" target="blank">
<img src="figures/foreign-reliefs.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/foreign-reliefs.svg" target="blank">Open diagram in a new tab.</a>


## Other Deductions

At present this only relates to seafarers, but other deductions will be added in future.

These endpoints allow a user to manage their data related to deductions from their tax bill.

The user can submit details of their deductions for a specific tax year, as well as amend submissions already made.  They also have the option to delete previous submissions, and to retrieve the information they have previously submitted.

* [Retrieve Deductions](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/other-deductions-api/1.0#_retrieve-deductions-test-only_get_accordion)
* [Create and Amend Deductions](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/other-deductions-api/1.0#_amend-deductions-test-only_put_accordion)
* [Delete Deductions](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/other-deductions-api/1.0#_delete-deductions-test-only_delete_accordion)

<a href="figures/other-deductions.svg" target="blank">
<img src="figures/other-deductions.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/other-deductions.svg" target="blank">Open diagram in a new tab.</a>

## Individual Expenses Other

These endpoints allow the user to manage their data related to expenses income for trade union and patent royalties.

The user can submit details of their expenses income for a specific tax year, as well as amend submissions already made.  They also have the option to delete previous submissions, and to retrieve the information they have previously submitted.

* [Retrieve Other Expenses](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-expenses-api/1.0#_retrieve-other-expenses-test-only_get_accordion)
* [Amend Other Expenses](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-expenses-api/1.0#_amend-other-expenses-test-only_put_accordion)
* [Delete Other Expenses](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-expenses-api/1.0#_delete-other-expenses-test-only_delete_accordion)

<a href="figures/expenses-other.svg" target="blank">
<img src="figures/expenses-other.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/expenses-other.svg" target="blank">Open diagram in a new tab.</a>

## Non-PAYE Income

Use the Non-PAYE Income resources of the Individuals Income Received API to create, amend, retrieve and delete data relating to non PAYE income and tips:

* [Create and Amend Non-PAYE employment income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0#_Create-and-Amend-Non-PAYE-employment-income-test-only_put_accordion)
* [Retrieve Non-PAYE employment income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0#_Retrieve-Non-PAYE-employment-income-test-only_get_accordion)
* [Delete Non-PAYE employment income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0#_Delete-Non-PAYE-employment-income-test-only_delete_accordion)

## State Benefits

These endpoints give a user the ability to manage data related to state benefits.  The user can add details about state benefits for a specific tax year, as well as update submissions already made.  They also have the option to delete previous submissions, and to retrieve the information they have previously submitted.

**Note**

* only pre-populated HMRC benefits can be ignored (end-of-year) or unignored
* attempting to delete a pre-populated state benefit will fail with a 'forbidden' response.
* a customer can only update amounts in-year for Job Seeker Allowance and Employment Support Allowance


* [List State Benefits](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-state-benefits-api/1.0#_list-state-benefits-test-only_get_accordion)
* [Create State Benefit](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-state-benefits-api/1.0#_add-state-benefit-test-only_post_accordion)
* [Amend State Benefit](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-state-benefits-api/1.0#_update-state-benefit-test-only_put_accordion)
* [Delete State Benefit](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-state-benefits-api/1.0#_delete-state-benefit-test-only_delete_accordion)
* [Create and Amend State Benefit Amounts](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-state-benefits-api/1.0#_update-state-benefit-amounts-test-only_put_accordion)
* [Delete State Benefit Amounts](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-state-benefits-api/1.0#_delete-state-benefit-amounts-test-only_delete_accordion)
* [Ignore State Benefit](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-state-benefits-api/1.0#_ignore-state-benefit-test-only_put_accordion)
* [Unignore State Benefit](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-state-benefits-api/1.0#Unignore%20State%20Benefit)

<a href="figures/state-benefits.svg" target="blank">
<img src="figures/state-benefits.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/state-benefits.svg" target="blank">Open diagram in a new tab.</a>
