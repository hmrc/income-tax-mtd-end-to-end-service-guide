---
title: Additional Income | Income Tax (MTD) End-to-End Service Guide
weight: 30
description: Software developers, designers, product owners or business analysts. Integrate your software with the Income Tax API for Making Tax Digital.
---

# Additional Income

## Submit information about personal income
### Self-assessment return

The software should prompt customers to make sure they have considered the following potential additional income sources (there are links to the APIs where the functionality is available, we will continue to release additional functionality and update this page).

* any income from [bank or building society interest](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/UK-Savings-Account) (supported in live)
* any income from [dividends](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Dividends-Income) (supported in live)  
*	any [gift aid contributions](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Charitable-Givings) they have made (supported in live)  
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

* [details of the employment](#employment-details)  
* [financial data and benefits from a specific employment](#financial-data-and-benefits)
* [employment expenses from all of the user’s employments](#employment-expenses)

### Employment details

Use these endpoints to maintain details of an employment:

* [Add a Custom Employment](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1{nino}~1{taxYear}/post)
* [Amend a Custom Employment](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1{nino}~1{taxYear}~1{employmentId}/put)
* [Retrieve an Employment](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D/get)
* [List Employments](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Delete a Custom Employment](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D/delete)
* [Ignore Employment](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D~1ignore/post)
* [Unignore Employment](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D~1unignore/post)

### Financial data and benefits

Use these endpoints to maintain financial data and benefits from a specific employment:

* [Create and Amend Employment Financial Details](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D~1financial-details/put)
* [Retrieve an Employment and its Financial Details](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D~1financial-details/get)
* [Delete Employment Financial Details](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D~1financial-details/delete)

#### Off-payroll working (OPW) rules

Off-payroll working rules (IR35) govern how a worker (sometimes called a contractor) who is providing their services through an intermediary such as a personal service company, is treated in terms of their Income Tax and National Insurance. More information on off-payroll working rules can be found on the [GOV.UK](https://www.gov.uk/guidance/understanding-off-payroll-working-ir35) website.

The off-payroll worker status can be seen in-year as part of the employment pre-population into the customer’s self-assessment tax calculations. In software, the off-payroll working status is retrieved using the [Retrieve an Employment and its Financial Details](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D~1financial-details/get) endpoint. The status is also available in the [Retrieve A Self Assessment Tax Calculation](/api-documentation/docs/api/ service/individual-calculations-api/5.0/oas/page#tag/Tax-Calculations/paths/~1individuals~1calculations~1%7Bnino%7D~1self-assessment~1%7BtaxYear%7D~1%7BcalculationId%7D/get) endpoint. If the status is set to false, indicating the worker is not regarded as being subject to OPW rules, the software should not display it to the customer. This status is view-only: the customer does not need to take any action unless they think it has been set in error, in which case they must contact their employer.

After the end of the tax year, the off-payroll working status will be displayed to the customer along with the employment data fields. As part of their self-assessment, if a customer agrees with their off-payroll working status, there is no further action required from them. However, if a customer disagrees with their off-payroll working status, they can change it after the end of tax year before completing their final declaration. This change can be made in software or through their HMRC online services account. The software must call the [Create and Amend Employment Financial Details](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D~1financial-details/put) endpoint to change the off-payroll working status. 

The following  warning message must be displayed to the customer:

> “Do you want to change your employment details? You are about to change information [insert employer name] sent to HMRC:

> * Off-payroll working status

> HMRC may review this change.”

As stated in the warning message, this action may be reviewed by HMRC.


### Employment expenses 

Use these endpoints to maintain employment expenses from all of the user’s employments:

* [Create and Amend Employment Expenses](/api-documentation/docs/api/service/individuals-expenses-api/2.0/oas/page#tag/Employment-Expenses/paths/~1individuals~1expenses~1employments~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Retrieve Employment Expenses](/api-documentation/docs/api/service/individuals-expenses-api/2.0/oas/page#tag/Employment-Expenses/paths/~1individuals~1expenses~1employments~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Delete Employment Expenses](/api-documentation/docs/api/service/individuals-expenses-api/2.0/oas/page#tag/Employment-Expenses/paths/~1individuals~1expenses~1employments~1%7Bnino%7D~1%7BtaxYear%7D/delete)
* [Ignore Employment Expenses](/api-documentation/docs/api/service/individuals-expenses-api/2.0/oas/page#tag/Employment-Expenses/paths/~1individuals~1expenses~1employments~1%7Bnino%7D~1%7BtaxYear%7D~1ignore/post)

### Pre-populated data

HMRC will pre-populate the employment information provided by employers. The user should check and correct the information, as necessary, prior to final declaration.

**Note:**

Pre-populated data can only be stopped (ignored) from being used in any tax calculation.

User-generated content:

* can be deleted
* will only be applied in the tax calculation
* will not overwrite pre-populated data

### Custom employments

Custom employments will only apply to the tax year and will not be carried over in subsequent years.  The expenses values are summed values from all PAYE employments, they are not available by employment.



## Other Employment Income

These endpoints allow a user to create, amend, retrieve and delete other employment income: Share options, Shares awarded or received, Lump sums, Disability and Foreign service.

* [Retrieve Other Employment Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Other-Employment-Income/paths/~1individuals~1income-received~1employments~1other~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Other Employment Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Other-Employment-Income/paths/~1individuals~1income-received~1employments~1other~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Other Employment Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Other-Employment-Income/paths/~1individuals~1income-received~1employments~1other~1%7Bnino%7D~1%7BtaxYear%7D/delete)


<a href="figures/other-employment-income.svg" target="blank">
<img src="figures/other-employment-income.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/other-employment-income.svg" target="blank">Open diagram in a new tab.</a>

## Dividends Income

These endpoints allow a user to create, retrieve, amend and delete dividends income: foreign dividend, dividend income received whilst abroad, stock dividend, redeemable shares, bonus issues of securities and close company loans written off.

* [Retrieve Dividends Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Dividends-Income/paths/~1individuals~1income-received~1dividends~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Dividends Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Dividends-Income/paths/~1individuals~1income-received~1dividends~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Dividends Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Dividends-Income/paths/~1individuals~1income-received~1dividends~1%7Bnino%7D~1%7BtaxYear%7D/delete)

<a href="figures/dividends-income.svg" target="blank">
<img src="figures/dividends-income.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/dividends-income.svg" target="blank">Open diagram in a new tab.</a>

## Foreign Income

Foreign income is any income earned outside England, Wales, Scotland and Northern Ireland. The Channel Islands and the Isle of Man are classed as foreign. 

Customers might need to pay UK income tax on their foreign income. This includes wages if they work abroad, foreign investment income and income from pensions held overseas. For more information about tax on foreign income, refer to [Tax on foreign income (GOV.UK)](https://www.gov.uk/tax-foreign-income).

Customers can use their software to submit information about foreign earnings and unremittable foreign income. The software can use the following endpoints to enable customers to:

- [Create and Amend Foreign Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Foreign-Income/paths/~1individuals~1income-received~1foreign~1{nino}~1{taxYear}/put)
- [Retrieve Foreign Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Foreign-Income/paths/~1individuals~1income-received~1foreign~1{nino}~1{taxYear}/get)
- [Delete Foreign Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Foreign-Income/paths/~1individuals~1income-received~1foreign~1{nino}~1{taxYear}/delete)

## Insurance Policies Income

Income from insurance policies is any chargeable gains from UK life insurance policies. This includes cash or other benefits received on a full or part surrender of a policy, a policy matured or brought to an end by the death of the life insured, the sale or assignment of a UK policy, or part of a policy. For more information about insurance policies income tax, refer to [Insurance Policyholder Taxation Manual (GOV.UK)](https://www.gov.uk/hmrc-internal-manuals/insurance-policyholder-taxation-manual).

Customers can use their software to submit different types of insurance policies income. This includes information about life insurance policies, capital redemption policies, life annuities, voided ISAs, and foreign policies.

The software can use the following endpoints to enable customers to:

- [Create and Amend Insurance Policies Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Insurance-Policies-Income/paths/~1individuals~1income-received~1insurance-policies~1{nino}~1{taxYear}/put)
- [Retrieve Insurance Policies Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Insurance-Policies-Income/paths/~1individuals~1income-received~1insurance-policies~1{nino}~1{taxYear}/get)
- [Delete Insurance Policies Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Insurance-Policies-Income/paths/~1individuals~1income-received~1insurance-policies~1{nino}~1{taxYear}/delete)

## Pensions Income

These endpoints allow a user to create, retrieve, amend and delete previously populated foreign pensions and overseas pension contributions.

* [Retrieve Pensions Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Pensions-Income/paths/~1individuals~1income-received~1pensions~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Pensions Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Pensions-Income/paths/~1individuals~1income-received~1pensions~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Pensions Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Pensions-Income/paths/~1individuals~1income-received~1pensions~1%7Bnino%7D~1%7BtaxYear%7D/delete)

<a href="figures/pensions-income.svg" target="blank">
<img src="figures/pensions-income.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/pensions-income.svg" target="blank">Open diagram in a new tab.</a>

## Other Income

These endpoints allow a user to create, retrieve, amend and delete other income: business receipts, all other income received whilst abroad, overseas income and gains, chargeable foreign benefits and gifts and omitted foreign income.

* [Retrieve Other Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Other-Income/paths/~1individuals~1income-received~1other~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Other Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Other-Income/paths/~1individuals~1income-received~1other~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Other Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Other-Income/paths/~1individuals~1income-received~1other~1%7Bnino%7D~1%7BtaxYear%7D/delete)

<a href="figures/other-income.svg" target="blank">
<img src="figures/other-income.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/other-income.svg" target="blank">Open diagram in a new tab.</a>

## Savings Income

These endpoints allow a user to create, retrieve, amend and delete savings income for securities or foreign interest.

* [Retrieve Savings Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Savings-Income/paths/~1individuals~1income-received~1savings~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Savings Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Savings-Income/paths/~1individuals~1income-received~1savings~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Savings Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Savings-Income/paths/~1individuals~1income-received~1savings~1%7Bnino%7D~1%7BtaxYear%7D/delete)

<a href="figures/savings-income.svg" target="blank">
<img src="figures/savings-income.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/savings-income.svg" target="blank">Open diagram in a new tab.</a>

## Savings Accounts

Customers must submit information to HMRC about any UK savings accounts they hold. For information about eligible account types, refer to [How to complete your tax return for Self Assessment (GOV.UK)](https://www.gov.uk/government/publications/self-assessment-tax-return-sa100#supplementary-pages).

Customers can use their software to submit information about each account and record the annual interest income data for it. The software can use the following endpoints to enable customers to:

- [Add a UK Savings Account](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/UK-Savings-Account/paths/~1individuals~1income-received~1savings~1uk-accounts~1{nino}/post)
- [Create and Amend a UK Savings Account Annual Summary](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/UK-Savings-Account/paths/~1individuals~1income-received~1savings~1uk-accounts~1{nino}~1{taxYear}~1{savingsAccountId}/put)
- [List All UK Savings Accounts](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/UK-Savings-Account/paths/~1individuals~1income-received~1savings~1uk-accounts~1{nino}/get)
- [Retrieve UK Savings Account Annual Summary](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/UK-Savings-Account/paths/~1individuals~1income-received~1savings~1uk-accounts~1{nino}~1{taxYear}~1{savingsAccountId}/get)

## Disclosures

These endpoints allow the user to manage their data related to the disclosure of tax avoidance schemes and undeclared income, for a given tax year.

The user can submit details of any disclosures for a specific tax year, as well as amend submissions already made.  They also have the option to delete previous submissions and to retrieve the information they have previously submitted.

The user would normally call this when they have all the information necessary for disclosures for the tax year.

* [Retrieve Disclosures](/api-documentation/docs/api/service/individuals-disclosures-api/1.0/oas/page#tag/Disclosures/paths/~1individuals~1disclosures~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Disclosures](/api-documentation/docs/api/service/individuals-disclosures-api/1.0/oas/page#tag/Disclosures/paths/~1individuals~1disclosures~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Disclosures](/api-documentation/docs/api/service/individuals-disclosures-api/1.0/oas/page#tag/Disclosures/paths/~1individuals~1disclosures~1%7Bnino%7D~1%7BtaxYear%7D/delete)

<a href="figures/disclosures.svg" target="blank">
<img src="figures/disclosures.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/disclosures.svg" target="blank">Open diagram in a new tab.</a>

## Pension Charges

These endpoints allow a user to manage data related to pension contributions and charges. The user can submit details of pension contributions and charges for a specific tax year, as well as amend submissions already made. The user also has the option to delete previous submissions, and to retrieve the information they have previously submitted.

* [Retrieve Pension Charges](/api-documentation/docs/api/service/individuals-charges-api/2.0/oas/page#/paths/~1individuals~1charges~1pensions~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Pension Charges](/api-documentation/docs/api/service/individuals-charges-api/2.0/oas/page#/paths/~1individuals~1charges~1pensions~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Pension Charges](/api-documentation/docs/api/service/individuals-charges-api/2.0/oas/page#/paths/~1individuals~1charges~1pensions~1%7Bnino%7D~1%7BtaxYear%7D/delete)

<a href="figures/pension-charges.svg" target="blank">
<img src="figures/pension-charges.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/pension-charges.svg" target="blank">Open diagram in a new tab.</a>




## Individual Reliefs

### Pensions Reliefs

These endpoints give the user the ability to manage data related to reliefs on pensions.  The user can submit details of reliefs on pensions for a specific tax year, as well as amend submissions already made.  They also have the option to delete previous submissions, and to retrieve the information they have previously submitted.

* [Retrieve Pensions Reliefs](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Pensions-Reliefs/paths/~1individuals~1reliefs~1pensions~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Pensions Reliefs](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Pensions-Reliefs/paths/~1individuals~1reliefs~1pensions~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Pensions Reliefs](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Pensions-Reliefs/paths/~1individuals~1reliefs~1pensions~1%7Bnino%7D~1%7BtaxYear%7D/delete)

<a href="figures/pension-reliefs.svg" target="blank">
<img src="figures/pension-reliefs.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/pension-reliefs.svg" target="blank">Open diagram in a new tab.</a>

### Relief Investments

These endpoints allow a user to create, amend, delete and retrieve relief investments from VCT subscriptions, EIS subscriptions, Community Investments, Seed Enterprise Investments and Social Enterprise Investments.

* [Retrieve Relief Investments](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Relief-Investments/paths/~1individuals~1reliefs~1investment~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Relief Investments](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Relief-Investments/paths/~1individuals~1reliefs~1investment~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Relief Investments](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Relief-Investments/paths/~1individuals~1reliefs~1investment~1%7Bnino%7D~1%7BtaxYear%7D/delete)

<a href="figures/relief-investments.svg" target="blank">
<img src="figures/relief-investments.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/relief-investments.svg" target="blank">Open diagram in a new tab.</a>


### Other Reliefs

These endpoints allow a user to create, amend, retrieve and delete reliefs other than investments that have previously been submitted.  This includes loan interest, payroll giving, shares and securities redemptions, maintenance payments, post-cessation reliefs, annual payments and qualifying loan interest payments.

* [Retrieve Other Reliefs](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Other-Reliefs/paths/~1individuals~1reliefs~1other~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Other Reliefs](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Other-Reliefs/paths/~1individuals~1reliefs~1other~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Delete Other Reliefs](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Other-Reliefs/paths/~1individuals~1reliefs~1other~1%7Bnino%7D~1%7BtaxYear%7D/delete)

<a href="figures/other-reliefs.svg" target="blank">
<img src="figures/other-reliefs.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/other-reliefs.svg" target="blank">Open diagram in a new tab.</a>


### Foreign Reliefs

These endpoints allow a user to create, retrieve, amend, and delete foreign reliefs that have been previously submitted.

* [Retrieve Foreign Reliefs](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Foreign-Reliefs/paths/~1individuals~1reliefs~1foreign~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Foreign Reliefs](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Foreign-Reliefs/paths/~1individuals~1reliefs~1foreign~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Foreign Reliefs](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Foreign-Reliefs/paths/~1individuals~1reliefs~1foreign~1%7Bnino%7D~1%7BtaxYear%7D/delete)

<a href="figures/foreign-reliefs.svg" target="blank">
<img src="figures/foreign-reliefs.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/foreign-reliefs.svg" target="blank">Open diagram in a new tab.</a>


## Other Deductions

At present this only relates to seafarers, but other deductions will be added in future.

These endpoints allow a user to manage their data related to deductions from their tax bill.

The user can submit details of their deductions for a specific tax year, as well as amend submissions already made.  They also have the option to delete previous submissions, and to retrieve the information they have previously submitted.

* [Retrieve Deductions](/api-documentation/docs/api/service/other-deductions-api/1.0/oas/page#/paths/~1individuals~1deductions~1other~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Deductions](/api-documentation/docs/api/service/other-deductions-api/1.0/oas/page#/paths/~1individuals~1deductions~1other~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Deductions](/api-documentation/docs/api/service/other-deductions-api/1.0/oas/page#/paths/~1individuals~1deductions~1other~1%7Bnino%7D~1%7BtaxYear%7D/delete)

<a href="figures/other-deductions.svg" target="blank">
<img src="figures/other-deductions.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/other-deductions.svg" target="blank">Open diagram in a new tab.</a>

## Individual Expenses Other

These endpoints allow the user to manage their data related to expenses income for trade union and patent royalties.

The user can submit details of their expenses income for a specific tax year, as well as amend submissions already made.  They also have the option to delete previous submissions, and to retrieve the information they have previously submitted.

* [Retrieve Other Expenses](/api-documentation/docs/api/service/individuals-expenses-api/2.0/oas/page#tag/Other-Expenses/paths/~1individuals~1expenses~1other~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Other Expenses](/api-documentation/docs/api/service/individuals-expenses-api/2.0/oas/page#tag/Other-Expenses/paths/~1individuals~1expenses~1other~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Other Expenses](/api-documentation/docs/api/service/individuals-expenses-api/2.0/oas/page#tag/Other-Expenses/paths/~1individuals~1expenses~1other~1%7Bnino%7D~1%7BtaxYear%7D/delete)

<a href="figures/expenses-other.svg" target="blank">
<img src="figures/expenses-other.svg" alt=" " style="width:720px;" />
</a>
<a href="figures/expenses-other.svg" target="blank">Open diagram in a new tab.</a>

## Non-PAYE Income

Use the [Non-PAYE Income resources of the Individuals Income Received API](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Non-PAYE-Employment-Income) to create, amend, retrieve and delete data relating to non PAYE income and tips:

* [Create and Amend Non-PAYE Employment Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Non-PAYE-Employment-Income/paths/~1individuals~1income-received~1employments~1non-paye~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Retrieve Non-PAYE Employment Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Non-PAYE-Employment-Income/paths/~1individuals~1income-received~1employments~1non-paye~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Delete Non-PAYE Employment Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Non-PAYE-Employment-Income/paths/~1individuals~1income-received~1employments~1non-paye~1%7Bnino%7D~1%7BtaxYear%7D/delete)

## State Benefits

These endpoints give a user the ability to manage data related to state benefits.  The user can add details about state benefits for a specific tax year, as well as update submissions already made.  They also have the option to delete previous submissions, and to retrieve the information they have previously submitted.

**Note**

* only pre-populated HMRC benefits can be ignored (end-of-year) or unignored
* attempting to delete a pre-populated state benefit will fail with a 'forbidden' response.
* a customer can only update amounts in-year for Job Seeker Allowance and Employment Support Allowance


* [List State Benefits](/api-documentation/docs/api/service/individuals-state-benefits-api/1.0/oas/page#/paths/~1individuals~1state-benefits~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create State Benefit](/api-documentation/docs/api/service/individuals-state-benefits-api/1.0/oas/page#/paths/~1individuals~1state-benefits~1%7Bnino%7D~1%7BtaxYear%7D/post)
* [Amend State Benefit](/api-documentation/docs/api/service/individuals-state-benefits-api/1.0/oas/page#/paths/~1individuals~1state-benefits~1%7Bnino%7D~1%7BtaxYear%7D~1%7BbenefitId%7D/put)
* [Delete State Benefit](/api-documentation/docs/api/service/individuals-state-benefits-api/1.0/oas/page#/paths/~1individuals~1state-benefits~1%7Bnino%7D~1%7BtaxYear%7D~1%7BbenefitId%7D/delete)
* [Amend State Benefit Amounts](/api-documentation/docs/api/service/individuals-state-benefits-api/1.0/oas/page#/paths/~1individuals~1state-benefits~1%7Bnino%7D~1%7BtaxYear%7D~1%7BbenefitId%7D~1amounts/put)
* [Delete State Benefit Amounts](/api-documentation/docs/api/service/individuals-state-benefits-api/1.0/oas/page#/paths/~1individuals~1state-benefits~1%7Bnino%7D~1%7BtaxYear%7D~1%7BbenefitId%7D~1amounts/delete)
* [Ignore State Benefit](/api-documentation/docs/api/service/individuals-state-benefits-api/1.0/oas/page#/paths/~1individuals~1state-benefits~1%7Bnino%7D~1%7BtaxYear%7D~1%7BbenefitId%7D~1ignore/post)
* [Unignore State Benefit](/api-documentation/docs/api/service/individuals-state-benefits-api/1.0/oas/page#/paths/~1individuals~1state-benefits~1%7Bnino%7D~1%7BtaxYear%7D~1%7BbenefitId%7D~1unignore/post)

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

Vendors can use the [create a brought forward loss](/api-documentation/docs/api/service/individual-losses-api/4.0/oas/page#tag/Brought-Forward-Losses/paths/~1individuals~1losses~1%7Bnino%7D~1brought-forward-losses/post) endpoint to enable customers to submit the brought forward loss to HMRC.

When the loss detail has been submitted, or if a loss arises for a tax year following sign up to Making Tax Digital, a claim will need to be made to either:

* utilise the loss against an income source for a specific year, or
* claim to carry the loss forward so that it is available to use in later years

The [Loss claims](/api-documentation/docs/api/service/individual-losses-api/4.0/oas/page#tag/Loss-Claims) endpoint allows the user to do the following:

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

## Capital Gains Tax

Capital Gains Tax is a tax on the profit when someone sells or disposes of an asset that has increased in value. Customers may need to report on the following types of asset:

* residential property
* other property 
* listed and unlisted shares and securities 

For more information on capital gains tax, see [Capital Gains Tax: what you pay it on, rates and allowances](https://www.gov.uk/capital-gains-tax).

MTD customers can also report any losses they have made. This charge may be set against earlier or later years. When the customer sells or disposes of the whole or part of a UK residential property and is liable to pay CGT, they must tell HMRC within a specific time following the date of completion of the sale. For more information on the reporting requirement, see [Report and pay your Capital Gains Tax: If you sold a property in the UK on or after 6 April 2020](https://www.gov.uk/report-and-pay-your-capital-gains-tax/if-you-sold-a-property-in-the-uk-on-or-after-6-april-2020). For non-resident customers, see [Tell HMRC about Capital Gains Tax on UK property or land if you’re not a UK resident](https://www.gov.uk/guidance/capital-gains-tax-for-non-residents-uk-residential-property), which advises on how these gains must be reported in year.

The customer can create, update, or delete their capital gains tax in software only after the end of the tax year. If they need to make changes during the year, they need to use HMRC online services. In some cases, customers must report and pay before they submit their final declaration. However, this information will still need to be included in their final declaration if they are a Self Assessment or MTD customer.

An MTD customer can do the following: 

* view CGT Residential Property Disposals for PPD, non-PPD and other capital gains and disposals
* create or amend CGT Residential Property Disposals for PPD, non-PPD and other capital gains and disposals
* delete CGT Residential Property Disposals for PPD, non-PPD and other capital gains and disposals

### Viewing CGT

At any time, a customer can view their capital gains tax information. In software, this information is retrieved using the following endpoints:

* [Retrieve All CGT Residential Property Disposals and Overrides (Includes PPD and Non-PPD)](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Capital-Gains-on-Residential-Property-Disposals/paths/~1individuals~1income-received~1disposals~1residential-property~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Retrieve Other Capital Gains and Disposals](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Other-Capital-Gains-and-Disposals/paths/~1individuals~1income-received~1disposals~1other-gains~1%7Bnino%7D~1%7BtaxYear%7D/get)

### Creating or Amending CGT

Customers can create or amend the different types of CGT information after the end of the tax year. This change must be done before they submit their final declaration. In software, this information is updated using the following endpoints:

* [Create and Amend ‘Report and Pay Capital Gains Tax on Property’ Overrides](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Capital-Gains-on-Residential-Property-Disposals/paths/~1individuals~1income-received~1disposals~1residential-property~1%7Bnino%7D~1%7BtaxYear%7D~1ppd/put)
* [Create and Amend CGT Residential Property Disposals](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Capital-Gains-on-Residential-Property-Disposals/paths/~1individuals~1income-received~1disposals~1residential-property~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Create and Amend Other Capital Gains and Disposals](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Other-Capital-Gains-and-Disposals/paths/~1individuals~1income-received~1disposals~1other-gains~1%7Bnino%7D~1%7BtaxYear%7D/put)

### Deleting CGT

Customers can delete different types of CGT only after the end of the tax year and only after they have created CGT using software. However, this change must be done before they submit their final declaration.  In software, this deletion is made using the following endpoints:

* [Delete ‘Report and Pay Capital Gains Tax on Residential Property’ Overrides](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Capital-Gains-on-Residential-Property-Disposals/paths/~1individuals~1income-received~1disposals~1residential-property~1%7Bnino%7D~1%7BtaxYear%7D~1ppd/delete)
* [Delete CGT Residential Property Disposals](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Capital-Gains-on-Residential-Property-Disposals/paths/~1individuals~1income-received~1disposals~1residential-property~1%7Bnino%7D~1%7BtaxYear%7D/delete)
* [Delete Other Capital Gains and Disposals](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Other-Capital-Gains-and-Disposals/paths/~1individuals~1income-received~1disposals~1other-gains~1%7Bnino%7D~1%7BtaxYear%7D/delete)

## Marriage Allowance

Marriage Allowance allows the customer to transfer some of their Personal Allowance to their husband, wife or civil partner. This will reduce the customer's tax in the next tax year (6 April to 5 April). For more information about marriage allowance, refer to [Marriage Allowance: How it works - GOV.UK](https://www.gov.uk/marriage-allowance).

Customers can create a Marriage Allowance claim using their name, date of birth and NINO. To do this action, the software must call the [Create Marriage Allowance](/api-documentation/docs/api/service/individuals-disclosures-api/1.0/oas/page#tag/Marriage-Allowance/paths/~1individuals~1disclosures~1marriage-allowance~1{nino}/post) endpoint in the [Individuals Disclosures API](/api-documentation/docs/api/service/individuals-disclosures-api/). Once the claim has been accepted by HMRC, the customer can view their Marriage Allowance in their tax calculations.
