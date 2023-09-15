---
title: Additional Income | Income Tax (MTD) End-to-End Service Guide
weight: 30
description: Software developers, designers, product owners or business analysts. Integrate your software with the Income Tax API for Making Tax Digital.
---

# Additional Income

## Submit information about personal income
### Self-assessment return

The software should prompt customers to make sure they have considered the following potential additional income sources (there are links to the APIs where the functionality is available, we will continue to release additional functionality and update this page).

* any income from [bank or building society interest](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0/oas/page#tag/UK-Savings-Account) (supported in live)
* any income from [dividends](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/1.0/oas/page#tag/Dividends-Income) (supported in live)  
*	any [gift aid contributions](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Charitable-Givings) they have made (supported in live)  
*	any pension contributions
*	any pension income
*	capital gains
*	income from employment
*	additional information (currently provided on the SA101)
*	any income from partnerships
*	any income from trusts
*	any foreign income

**Note:**

Information currently provided through the existing self-assessment process: if a customer needs to report information to HMRC that is not yet supported under MTD or your software, they will need to complete a Self Assessment tax return.  Any information they have provided through MTD will not be considered and they will have to submit everything through the existing HMRC Self Assessment service.



## Employments

This suite of endpoints display the PAYE information returned to HMRC by a user’s employers.

The user will be able to add to or supply different employment data after the tax year has ended.  This can include details of missing employments, or financial data.  In addition, the user can choose to ignore the data HMRC holds, for the purpose of their self-assessment calculation.

These endpoints can be broken into three categories:

* details of the employment  
* financial data and benefits from a specific employment
* employment expenses from all of the user’s employments


[Add a Custom Employment](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1{nino}~1{taxYear}/post)

[Amend a Custom Employment](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1{nino}~1{taxYear}~1{employmentId}/put)

[Retrieve an Employment](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D/get)

[List Employments](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1%7Bnino%7D~1%7BtaxYear%7D/get)

[Delete a Custom Employment](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D/delete)

[Ignore Employment](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D~1ignore/post)

[Unignore Employment](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D~1unignore/post)

[Create and Amend Employment Financial Details](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D~1financial-details/put)

[Retrieve an Employment and its Financial Details](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D~1financial-details/get)

[Delete Employment Financial Details](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D~1financial-details/delete)

[Create and Amend Employment Expenses](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-expenses-api/1.0/oas/page#tag/Employment-Expenses/paths/~1individuals~1expenses~1employments~1%7Bnino%7D~1%7BtaxYear%7D/put)

[Retrieve Employment Expenses](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-expenses-api/1.0/oas/page#tag/Employment-Expenses/paths/~1individuals~1expenses~1employments~1%7Bnino%7D~1%7BtaxYear%7D/get)

[Delete Employment Expenses](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-expenses-api/1.0/oas/page#tag/Employment-Expenses/paths/~1individuals~1expenses~1employments~1%7Bnino%7D~1%7BtaxYear%7D/delete)

[Ignore Employment Expenses](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-expenses-api/1.0/oas/page#tag/Employment-Expenses/paths/~1individuals~1expenses~1employments~1%7Bnino%7D~1%7BtaxYear%7D~1ignore/post)
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

* [Retrieve Other Employment Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Other-Employment-Income/paths/~1individuals~1income-received~1employments~1other~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Other Employment Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Other-Employment-Income/paths/~1individuals~1income-received~1employments~1other~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Other Employment Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Other-Employment-Income/paths/~1individuals~1income-received~1employments~1other~1%7Bnino%7D~1%7BtaxYear%7D/delete)


<a href="figures/other-employment-income.svg" target="blank">
<img src="figures/other-employment-income.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/other-employment-income.svg" target="blank">Open diagram in a new tab.</a>

## Dividends Income

These endpoints allow a user to create, retrieve, amend and delete dividends income: foreign dividend, dividend income received whilst abroad, stock dividend, redeemable shares, bonus issues of securities and close company loans written off.

* [Retrieve Dividends Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Dividends-Income/paths/~1individuals~1income-received~1dividends~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Dividends Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Dividends-Income/paths/~1individuals~1income-received~1dividends~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Dividends Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Dividends-Income/paths/~1individuals~1income-received~1dividends~1%7Bnino%7D~1%7BtaxYear%7D/delete)

<a href="figures/dividends-income.svg" target="blank">
<img src="figures/dividends-income.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/dividends-income.svg" target="blank">Open diagram in a new tab.</a>

## Foreign Income

These endpoints give a user the ability to manage their data related to foreign earnings and unremittable foreign income.

The user can submit details of their foreign earnings and foreign income for a specific tax year, as well as amend submissions already made.  They also have the option to delete previous submissions and to retrieve the information they have previously submitted.

* [Retrieve Foreign Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Foreign-Income/paths/~1individuals~1income-received~1foreign~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Foreign Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Foreign-Income/paths/~1individuals~1income-received~1foreign~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Foreign Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Foreign-Income/paths/~1individuals~1income-received~1foreign~1%7Bnino%7D~1%7BtaxYear%7D/delete)

<a href="figures/foreign-income.svg" target="blank">
<img src="figures/foreign-income.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/foreign-income.svg" target="blank">Open diagram in a new tab.</a>

## Insurance Policies Income

These endpoints allow a user to create, retrieve, amend and delete insurance policies and income for less common types of income: Life Insurance Policies, Life Annuity Contracts, Capital Redemption Policies, Voided ISAs, and Foreign Policies.

* [Retrieve Insurance Policies Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Insurance-Policies-Income/paths/~1individuals~1income-received~1insurance-policies~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Insurance Policies Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Insurance-Policies-Income/paths/~1individuals~1income-received~1insurance-policies~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Insurance Policies Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Insurance-Policies-Income/paths/~1individuals~1income-received~1insurance-policies~1%7Bnino%7D~1%7BtaxYear%7D/delete)

<a href="figures/insurance-policies-income.svg" target="blank">
<img src="figures/insurance-policies-income.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/insurance-policies-income.svg" target="blank">Open diagram in a new tab.</a>

## Pensions Income

These endpoints allow a user to create, retrieve, amend and delete previously populated foreign pensions and overseas pension contributions.

* [Retrieve Pensions Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Pensions-Income/paths/~1individuals~1income-received~1pensions~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Pensions Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Pensions-Income/paths/~1individuals~1income-received~1pensions~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Pensions Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Pensions-Income/paths/~1individuals~1income-received~1pensions~1%7Bnino%7D~1%7BtaxYear%7D/delete)

<a href="figures/pensions-income.svg" target="blank">
<img src="figures/pensions-income.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/pensions-income.svg" target="blank">Open diagram in a new tab.</a>

## Other Income

These endpoints allow a user to create, retrieve, amend and delete other income: business receipts, all other income received whilst abroad, overseas income and gains, chargeable foreign benefits and gifts and omitted foreign income.

* [Retrieve Other Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Other-Income/paths/~1individuals~1income-received~1other~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Other Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Other-Income/paths/~1individuals~1income-received~1other~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Other Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Other-Income/paths/~1individuals~1income-received~1other~1%7Bnino%7D~1%7BtaxYear%7D/delete)

<a href="figures/other-income.svg" target="blank">
<img src="figures/other-income.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/other-income.svg" target="blank">Open diagram in a new tab.</a>

## Savings Income

These endpoints allow a user to create, retrieve, amend and delete savings income for securities or foreign interest.

* [Retrieve Savings Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Savings-Income/paths/~1individuals~1income-received~1savings~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Savings Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Savings-Income/paths/~1individuals~1income-received~1savings~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Savings Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Savings-Income/paths/~1individuals~1income-received~1savings~1%7Bnino%7D~1%7BtaxYear%7D/delete)

<a href="figures/savings-income.svg" target="blank">
<img src="figures/savings-income.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/savings-income.svg" target="blank">Open diagram in a new tab.</a>

## Savings Accounts

These endpoints allow a user to retrieve and maintain information about an individual's UK savings account.

* [List All UK Savings Accounts](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/UK-Savings-Account/paths/~1individuals~1income-received~1savings~1uk-accounts~1%7Bnino%7D/get)
* [Add a UK Savings Account](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/UK-Savings-Account/paths/~1individuals~1income-received~1savings~1uk-accounts~1%7Bnino%7D/post)
* [Retrieve UK Savings Account Annual Summary](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/UK-Savings-Account/paths/~1individuals~1income-received~1savings~1uk-accounts~1%7Bnino%7D~1%7BtaxYear%7D~1%7BsavingsAccountId%7D/get)
* [Create and Amend a UK Savings Account Annual Summary](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/UK-Savings-Account/paths/~1individuals~1income-received~1savings~1uk-accounts~1%7Bnino%7D~1%7BtaxYear%7D~1%7BsavingsAccountId%7D/put)

<a href="figures/savings-accounts.svg" target="blank">
<img src="figures/savings-accounts.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/savings-accounts.svg" target="blank">Open diagram in a new tab.</a>

## Disclosures

These endpoints allow the user to manage their data related to the disclosure of tax avoidance schemes and undeclared income, for a given tax year.

The user can submit details of any disclosures for a specific tax year, as well as amend submissions already made.  They also have the option to delete previous submissions and to retrieve the information they have previously submitted.

The user would normally call this when they have all the information necessary for disclosures for the tax year.

* [Retrieve Disclosures](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-disclosures-api/1.0/oas/page#tag/Disclosures/paths/~1individuals~1disclosures~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Disclosures](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-disclosures-api/1.0/oas/page#tag/Disclosures/paths/~1individuals~1disclosures~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Disclosures](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-disclosures-api/1.0/oas/page#tag/Disclosures/paths/~1individuals~1disclosures~1%7Bnino%7D~1%7BtaxYear%7D/delete)

<a href="figures/disclosures.svg" target="blank">
<img src="figures/disclosures.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/disclosures.svg" target="blank">Open diagram in a new tab.</a>

## Pension Charges

These endpoints allow a user to manage data related to pension contributions and charges. The user can submit details of pension contributions and charges for a specific tax year, as well as amend submissions already made. The user also has the option to delete previous submissions, and to retrieve the information they have previously submitted.

* [Retrieve Pension Charges](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-charges-api/2.0/oas/page#/paths/~1individuals~1charges~1pensions~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Pension Charges](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-charges-api/2.0/oas/page#/paths/~1individuals~1charges~1pensions~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Pension Charges](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-charges-api/2.0/oas/page#/paths/~1individuals~1charges~1pensions~1%7Bnino%7D~1%7BtaxYear%7D/delete)

<a href="figures/pension-charges.svg" target="blank">
<img src="figures/pension-charges.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/pension-charges.svg" target="blank">Open diagram in a new tab.</a>




## Individual Reliefs

### Pensions Reliefs

These endpoints give the user the ability to manage data related to reliefs on pensions.  The user can submit details of reliefs on pensions for a specific tax year, as well as amend submissions already made.  They also have the option to delete previous submissions, and to retrieve the information they have previously submitted.

* [Retrieve Pensions Reliefs](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Pensions-Reliefs/paths/~1individuals~1reliefs~1pensions~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Pensions Reliefs](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Pensions-Reliefs/paths/~1individuals~1reliefs~1pensions~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Pensions Reliefs](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Pensions-Reliefs/paths/~1individuals~1reliefs~1pensions~1%7Bnino%7D~1%7BtaxYear%7D/delete)

<a href="figures/pension-reliefs.svg" target="blank">
<img src="figures/pension-reliefs.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/pension-reliefs.svg" target="blank">Open diagram in a new tab.</a>

### Relief Investments

These endpoints allow a user to create, amend, delete and retrieve relief investments from VCT subscriptions, EIS subscriptions, Community Investments, Seed Enterprise Investments and Social Enterprise Investments.

* [Retrieve Relief Investments](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Relief-Investments/paths/~1individuals~1reliefs~1investment~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Relief Investments](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Relief-Investments/paths/~1individuals~1reliefs~1investment~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Relief Investments](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Relief-Investments/paths/~1individuals~1reliefs~1investment~1%7Bnino%7D~1%7BtaxYear%7D/delete)

<a href="figures/relief-investments.svg" target="blank">
<img src="figures/relief-investments.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/relief-investments.svg" target="blank">Open diagram in a new tab.</a>


### Other Reliefs

These endpoints allow a user to create, amend, retrieve and delete reliefs other than investments that have previously been submitted.  This includes loan interest, payroll giving, shares and securities redemptions, maintenance payments, post-cessation reliefs, annual payments and qualifying loan interest payments.

* [Retrieve Other Reliefs](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Other-Reliefs/paths/~1individuals~1reliefs~1other~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Other Reliefs](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Other-Reliefs/paths/~1individuals~1reliefs~1other~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Delete Other Reliefs](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Other-Reliefs/paths/~1individuals~1reliefs~1other~1%7Bnino%7D~1%7BtaxYear%7D/delete)

<a href="figures/other-reliefs.svg" target="blank">
<img src="figures/other-reliefs.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/other-reliefs.svg" target="blank">Open diagram in a new tab.</a>


### Foreign Reliefs

These endpoints allow a user to create, retrieve, amend, and delete foreign reliefs that have been previously submitted.

* [Retrieve Foreign Reliefs](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Foreign-Reliefs/paths/~1individuals~1reliefs~1foreign~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Foreign Reliefs](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Foreign-Reliefs/paths/~1individuals~1reliefs~1foreign~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Foreign Reliefs](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Foreign-Reliefs/paths/~1individuals~1reliefs~1foreign~1%7Bnino%7D~1%7BtaxYear%7D/delete)

<a href="figures/foreign-reliefs.svg" target="blank">
<img src="figures/foreign-reliefs.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/foreign-reliefs.svg" target="blank">Open diagram in a new tab.</a>


## Other Deductions

At present this only relates to seafarers, but other deductions will be added in future.

These endpoints allow a user to manage their data related to deductions from their tax bill.

The user can submit details of their deductions for a specific tax year, as well as amend submissions already made.  They also have the option to delete previous submissions, and to retrieve the information they have previously submitted.

* [Retrieve Deductions](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/other-deductions-api/1.0/oas/page#/paths/~1individuals~1deductions~1other~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Deductions](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/other-deductions-api/1.0/oas/page#/paths/~1individuals~1deductions~1other~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Deductions](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/other-deductions-api/1.0/oas/page#/paths/~1individuals~1deductions~1other~1%7Bnino%7D~1%7BtaxYear%7D/delete)

<a href="figures/other-deductions.svg" target="blank">
<img src="figures/other-deductions.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/other-deductions.svg" target="blank">Open diagram in a new tab.</a>

## Individual Expenses Other

These endpoints allow the user to manage their data related to expenses income for trade union and patent royalties.

The user can submit details of their expenses income for a specific tax year, as well as amend submissions already made.  They also have the option to delete previous submissions, and to retrieve the information they have previously submitted.

* [Retrieve Other Expenses](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-expenses-api/1.0/oas/page#tag/Other-Expenses/paths/~1individuals~1expenses~1other~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Other Expenses](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-expenses-api/1.0/oas/page#tag/Other-Expenses/paths/~1individuals~1expenses~1other~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Other Expenses](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-expenses-api/1.0/oas/page#tag/Other-Expenses/paths/~1individuals~1expenses~1other~1%7Bnino%7D~1%7BtaxYear%7D/delete)

<a href="figures/expenses-other.svg" target="blank">
<img src="figures/expenses-other.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/expenses-other.svg" target="blank">Open diagram in a new tab.</a>

## Non-PAYE Income

Use the [Non-PAYE Income resources of the Individuals Income Received API](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Non-PAYE-Employment-Income) to create, amend, retrieve and delete data relating to non PAYE income and tips:

* [Create and Amend Non-PAYE Employment Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Non-PAYE-Employment-Income/paths/~1individuals~1income-received~1employments~1non-paye~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Retrieve Non-PAYE Employment Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Non-PAYE-Employment-Income/paths/~1individuals~1income-received~1employments~1non-paye~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Delete Non-PAYE Employment Income](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Non-PAYE-Employment-Income/paths/~1individuals~1income-received~1employments~1non-paye~1%7Bnino%7D~1%7BtaxYear%7D/delete)

## State Benefits

These endpoints give a user the ability to manage data related to state benefits.  The user can add details about state benefits for a specific tax year, as well as update submissions already made.  They also have the option to delete previous submissions, and to retrieve the information they have previously submitted.

**Note**

* only pre-populated HMRC benefits can be ignored (end-of-year) or unignored
* attempting to delete a pre-populated state benefit will fail with a 'forbidden' response.
* a customer can only update amounts in-year for Job Seeker Allowance and Employment Support Allowance


* [List State Benefits](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-state-benefits-api/1.0/oas/page#/paths/~1individuals~1state-benefits~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create State Benefit](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-state-benefits-api/1.0/oas/page#/paths/~1individuals~1state-benefits~1%7Bnino%7D~1%7BtaxYear%7D/post)
* [Amend State Benefit](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-state-benefits-api/1.0/oas/page#/paths/~1individuals~1state-benefits~1%7Bnino%7D~1%7BtaxYear%7D~1%7BbenefitId%7D/put)
* [Delete State Benefit](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-state-benefits-api/1.0/oas/page#/paths/~1individuals~1state-benefits~1%7Bnino%7D~1%7BtaxYear%7D~1%7BbenefitId%7D/delete)
* [Amend State Benefit Amounts](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-state-benefits-api/1.0/oas/page#/paths/~1individuals~1state-benefits~1%7Bnino%7D~1%7BtaxYear%7D~1%7BbenefitId%7D~1amounts/put)
* [Delete State Benefit Amounts](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-state-benefits-api/1.0/oas/page#/paths/~1individuals~1state-benefits~1%7Bnino%7D~1%7BtaxYear%7D~1%7BbenefitId%7D~1amounts/delete)
* [Ignore State Benefit](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-state-benefits-api/1.0/oas/page#/paths/~1individuals~1state-benefits~1%7Bnino%7D~1%7BtaxYear%7D~1%7BbenefitId%7D~1ignore/post)
* [Unignore State Benefit](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-state-benefits-api/1.0/oas/page#/paths/~1individuals~1state-benefits~1%7Bnino%7D~1%7BtaxYear%7D~1%7BbenefitId%7D~1unignore/post)

<a href="figures/state-benefits.svg" target="blank">
<img src="figures/state-benefits.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/state-benefits.svg" target="blank">Open diagram in a new tab.</a>

## Providing information about how to treat a loss

### Losses and claims

A self-employed business can have a loss when the trade expenses are more than the trade income.
If the business has a loss for a year prior to signing up to Making Tax Digital, the customer or agent will need to submit details of the loss to be brought forward.

<a href="figures/losses-api-diagram.svg" target="blank"><img src="figures/losses-api-diagram.svg" alt="Losses API calls" style="width:720px;" /></a>

<a href="figures/losses-api-diagram.svg" target="blank">Open the Losses diagram in a new tab</a>.

Vendors can use the [create a brought forward loss](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individual-losses-api/4.0/oas/page#tag/Brought-Forward-Losses/paths/~1individuals~1losses~1%7Bnino%7D~1brought-forward-losses/post) endpoint to enable customers to submit the brought forward loss to HMRC.

When the loss detail has been submitted, or if a loss arises for a tax year following sign up to Making Tax Digital, a claim will need to be made to either:

* utilise the loss against an income source for a specific year, or
* claim to carry the loss forward so that it is available to use in later years

The [Loss claims](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individual-losses-api/4.0/oas/page#tag/Loss-Claims) endpoint allows the user to do the following:

* provide a list of Loss claims
* create a Loss claim against an income source for a specific tax year
* show the detail of an existing Loss claim
* delete a previously entered Loss claim
* update a previously entered Loss claim

### Brought Forward Losses

These resources allow software packages to provide a customer's financial data for their brought forward losses. Here the developer can:

* provide a list of brought forward losses
* create a new brought forward loss to submit against self-employment, self-employment class 4, UK FHL property, other UK (non-FHL) property, foreign property FHL in the European Economic Area (EEA) or other foreign property
* show a single brought forward loss
* delete an existing brought forward loss
* update an existing brought forward loss

To carry-back a loss, the customer should contact HMRC who will be able to apply this manually.

