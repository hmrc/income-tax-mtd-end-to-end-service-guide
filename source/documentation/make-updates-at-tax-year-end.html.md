---
title: Making updates at the end of a tax year | Income Tax (Making Tax Digital) end-to-end service guide
weight: 7
description: Software developers, designers, product owners or business analysts. Integrate your software with the Income Tax API for Making Tax Digital.
---

# Making updates at the end of a tax year

## Additional information

If Making Tax Digital (MTD) customers are earning any type of income in addition to their self-employment and property income, they must report that to HMRC just as they would in their Self Assessment return. 

><p>Currently, the endpoints for reporting additional income through software are included in the 
	<a href="/api-documentation/docs/api/service/individuals-income-received-api/">Individuals Income Received API</a>. As of June 2024, the Individuals Income Received API will be deprecated and replaced with the following new APIs:</p><ul> 
	<li><a href="/api-documentation/docs/api/service/individuals-employments-income-api/">Individuals Employments Income API</a></li>
	<li><a href="/api-documentation/docs/api/service/individuals-dividends-income-api/">Individuals Dividends Income API</a></li>
	<li><a href="/api-documentation/docs/api/service/individuals-foreign-income-api/">Individuals Foreign Income API</a></li> 
	<li><a href="/api-documentation/docs/api/service/individuals-insurance-policies-income-api/">Individuals Insurance Policies Income API</a></li>
	<li><a href="/api-documentation/docs/api/service/individuals-pensions-income-api/">Individuals Pensions Income API</a></li>
	<li><a href="/api-documentation/docs/api/service/individuals-other-income-api/">Individuals Other Income API</a></li>
	<li><a href="/api-documentation/docs/api/service/individuals-savings-income-api/">Individuals Savings Income API</a></li>
	<li><a href="/api-documentation/docs/api/service/individuals-capital-gains-income-api/">Individuals Capital Gains Income API</a></li></ul>
<p>These new APIs are now available for testing in Sandbox.</p>

Your software should prompt customers to provide details about any additional income sources. If the software does not support submission of any applicable additional income, customers must use [HMRC online services](/guides/income-tax-mtd-end-to-end-service-guide/documentation/tasks-outside-mtd-software.html#hmrc-online-services) to make their submission. For more information about which type of income to tell HMRC, refer to [Check if you need to tell HMRC about additional income (GOV.UK)](https://www.gov.uk/check-additional-income-tax). 

Customers who need to submit their additional income must do it before submitting their final declaration. The following sections cover the different types of additional income and the endpoints needed to submit them in the software. 

### Construction Industry Scheme

Under the Construction Industry Scheme (CIS), [contractors](https://www.gov.uk/what-you-must-do-as-a-cis-contractor) deduct money from a [subcontractor's](https://www.gov.uk/what-you-must-do-as-a-cis-subcontractor) payments and send it to HM Revenue and Customs (HMRC). 

Currently, under Self Assessment, a subcontractor submits their deductions on their Self Assessment return and it is checked against HMRC records with what their contractor(s) have submitted. 

Under Making Tax Digital for ITSA, a customer can view what has been submitted by their contractor through their [HMRC online services](/guides/income-tax-mtd-end-to-end-service-guide/documentation/tasks-outside-mtd-software.html#hmrc-online-services) account or their software. Customers can complete the following tasks on their CIS deductions:

- [view CIS deductions](#view-cis-deductions)
- [create CIS deductions](#create-cis-deductions)
- [amend CIS deductions](#amend-cis-deductions)
- [delete CIS deductions](#delete-cis-deductions)

#### View CIS deductions

A customer, at any time, can view a breakdown of all the CIS deductions that have been reported to HMRC by their contractors. In software, this is done by calling the [Retrieve CIS Deductions for Subcontractor](/api-documentation/docs/api/service/cis-deductions-api/2.0/oas/page#/paths/~1individuals~1deductions~1cis~1%7Bnino%7D~1current-position~1%7BtaxYear%7D~1%7Bsource%7D/get) endpoint.

<a href="figures/cis-retrieve-cis.svg" target="blank"><img src="figures/cis-retrieve-cis.svg" alt="CIS create diagram" style="width:720px;" /></a>
<a href="figures/cis-retrieve-cis.svg" target="blank">Open the CIS retrieve deduction diagram in a new tab</a>.

When the customer submits quarterly updates to HMRC through their software, they will not be required to provide a CIS deduction amount. When a quarterly update has been made, the software will trigger the tax calculation using the [Trigger a Self Assessment Tax Calculation](/api-documentation/docs/api/service/individual-calculations-api/5.0/oas/page#tag/Tax-Calculations/paths/~1individuals~1calculations~1%7Bnino%7D~1self-assessment~1%7BtaxYear%7D/post) endpoint and display the calculation result to the customer using the [Retrieve A Self Assessment Tax Calculation](/api-documentation/docs/api/service/individual-calculations-api/5.0/oas/page#tag/Tax-Calculations/paths/~1individuals~1calculations~1%7Bnino%7D~1self-assessment~1%7BtaxYear%7D~1%7BcalculationId%7D/get) endpoint. This calculation result will include the CIS deductions received by the contractor for that quarter.

If the customer does not agree with the amount the contractor has submitted to HMRC for any of their quarterly updates, HMRC advises them to query any discrepancies with their contractor. 

#### Create CIS deductions

At the end of the year, if the customer still does not agree with the CIS deductions amount the contractor has submitted to HMRC, they can submit what they believe to be the correct amount. This needs to be completed following the fourth quarterly update and before the end-of-period statement is submitted. In software, this is done by calling the [Create CIS Deductions for Subcontractor](/api-documentation/docs/api/service/cis-deductions-api/2.0/oas/page#/paths/~1individuals~1deductions~1cis~1%7Bnino%7D~1amendments/post) endpoint. After successfully creating CIS deductions for the customer, the API returns a submission ID in the success response. This ID must be used to amend or delete CIS deductions in the future. A customer might also submit their CIS deductions amount if they find that no data from the contractor is included in the tax calculation.

<a href="figures/cis-create-cis.svg" target="blank"><img src="figures/cis-create-cis.svg" alt="CIS create diagram" style="width:720px;" /></a>
<a href="figures/cis-create-cis.svg" target="blank">Open the CIS create deduction diagram in a new tab</a>

#### Amend CIS deductions

If the customer has submitted a CIS deduction amount after the end of the year but later realises what they submitted was incorrect, they can provide the correct CIS deduction amount. This amendment can be made even after the end-of-period statement is submitted. However, it needs to be done before the final declaration is submitted. In software, amending CIS deductions is done by calling the [Amend CIS Deductions for Subcontractor](/api-documentation/docs/api/service/cis-deductions-api/2.0/oas/page#/paths/~1individuals~1deductions~1cis~1%7Bnino%7D~1amendments~1%7BsubmissionId%7D/put) endpoint.

<a href="figures/cis-amend-cis.svg" target="blank"><img src="figures/cis-amend-cis.svg" alt="CIS amend diagram" style="width:720px;" /></a>
<a href="figures/cis-amend-cis.svg" target="blank">Open the CIS amend deduction diagram in a new tab</a>

#### Delete CIS deductions

If the customer has submitted a CIS deduction amount after the end of the year but later realises they did not pay any CIS deductions and what they submitted was incorrect, they can delete the amount. This deletion can be made even after the end-of-period statement is submitted. However, it needs to be done before the final declaration is submitted. In software, deleting CIS deductions is done by calling the [Delete CIS Deductions for Subcontractor](/api-documentation/docs/api/service/cis-deductions-api/2.0/oas/page#/paths/~1individuals~1deductions~1cis~1%7Bnino%7D~1amendments~1%7BsubmissionId%7D/delete) endpoint.

<a href="figures/cis-delete-cis.svg" target="blank"><img src="figures/cis-delete-cis.svg" alt="CIS delete diagram" style="width:720px;" /></a>
<a href="figures/cis-delete-cis.svg" target="blank">Open the CIS delete deduction diagram in a new tab</a>

### Employment income

A customer will have employment income if they work for an employer who deducts tax from their pay through Pay As You Earn (PAYE). A customer's earnings and tax deducted are sent to HMRC by their employer. This allows HMRC to hold an employment history for each customer. HMRC uses this information to calculate whether the correct PAYE tax has been paid at the end of the tax year. For more information about declaring employment income, refer to [Self Assessment: Employment (GOV.UK).](https://www.gov.uk/government/publications/self-assessment-employment-sa102)

Currently, under Self Assessment, a customer will see their PAYE earnings, tax deducted and other financial details pre-populated in their online tax return. They can overwrite any information that might be incorrect. 

Customers can continue to do this under Making Tax Digital (MTD). They can:

- view employment details (financial and non-financial) held by HMRC throughout the year
- create and amend employment details submitted by them after the end of the tax year
- delete employment details submitted by them after the end of the tax year

#### View employment details

The following endpoints enables the customer to view different types of employment details:

- [List Employments](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1{nino}~1{taxYear}/get)
- [Retrieve an Employment](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1{nino}~1{taxYear}~1{employmentId}/get)
- [Retrieve Other Employment Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Other-Employment-Income/paths/~1individuals~1income-received~1employments~1other~1{nino}~1{taxYear}/get)
- [Retrieve an Employment and its Financial Details](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1{nino}~1{taxYear}~1{employmentId}~1financial-details/get)

A customer, at any time, can view a list of their employers for a specific tax year. The [List Employments](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1{nino}~1{taxYear}/get) endpoint provides the software with the Employment IDs for each customer employment. This Employment ID is necessary to call other employment income endpoints.

The software can use the [Retrieve an Employment](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1{nino}~1{taxYear}~1{employmentId}/get) endpoint to enable the customer to view non-financial details about a specific employment for a given tax year. This includes the start date of the employment and employer name.

The software can use the [Retrieve Other Employment Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Other-Employment-Income/paths/~1individuals~1income-received~1employments~1other~1{nino}~1{taxYear}/get) endpoint to enable the customer to view other employment income details for a given year. This includes share options, shares awarded or received, disability, lump sums and foreign service income.

Employers will also submit financial details that form the customers earnings and deductions. In software, this information can be viewed using the [Retrieve an Employment and its Financial Details](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1{nino}~1{taxYear}~1{employmentId}~1financial-details/get) endpoint. The endpoint contains details on taxable pay to date, [benefits in kind](https://www.gov.uk/tax-company-benefits), student loan deductions and the customer's off payroll working status for a specific employment.

#### Off-payroll working (OPW) rules

Off-payroll working rules (IR35) govern how a worker (sometimes called a contractor) who is providing their services through an intermediary such as a personal service company, is treated in terms of their Income Tax and National Insurance. For more information about off-payroll working rules, refer to [Understanding off-payroll working (IR35)(GOV.UK)](https://www.gov.uk/guidance/understanding-off-payroll-working-ir35).

The off-payroll worker status can be seen in-year as part of the employment pre-population into the customer’s self-assessment tax calculations. In software, the off-payroll working status is retrieved using the [Retrieve an Employment and its Financial Details](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D~1financial-details/get) endpoint. The status is also available in the [Retrieve A Self Assessment Tax Calculation](/api-documentation/docs/api/ service/individual-calculations-api/5.0/oas/page#tag/Tax-Calculations/paths/~1individuals~1calculations~1%7Bnino%7D~1self-assessment~1%7BtaxYear%7D~1%7BcalculationId%7D/get) endpoint. If the status is set to false, indicating the worker is not regarded as being subject to OPW rules, the software should not display it to the customer. This status is view-only: the customer does not need to take any action unless they think it has been set in error, in which case they must contact their employer.

After the end of the tax year, the off-payroll working status will be displayed to the customer along with the employment data fields. As part of their self-assessment, if a customer agrees with their off-payroll working status, there is no further action required from them. However, if a customer disagrees with their off-payroll working status, they can change it after the end of tax year before completing their final declaration. This change can be made in software or through their [HMRC online services](/guides/income-tax-mtd-end-to-end-service-guide/documentation/tasks-outside-mtd-software.html#hmrc-online-services) account. The software must call the [Create and Amend Employment Financial Details](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D~1financial-details/put) endpoint to change the off-payroll working status. 

The following  warning message must be displayed to the customer:

> “Do you want to change your employment details? You are about to change information [insert employer name] sent to HMRC:

> * Off-payroll working status

> HMRC may review this change.”

As stated in the warning message, this action may be reviewed by HMRC.

#### Create and Amend employment details

The following endpoints enable the customer to create and amend different types of employment details:

- [Add a Custom Employment](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1{nino}~1{taxYear}/post)
- [Amend a Custom Employment](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1{nino}~1{taxYear}~1{employmentId}/put)
- [Create and Amend Employment Financial Details ](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1{nino}~1{taxYear}~1{employmentId}~1financial-details/put)
- [Create and Amend Other Employment Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Other-Employment-Income/paths/~1individuals~1income-received~1employments~1other~1{nino}~1{taxYear}/put)

At the end of the tax year, if the customer thinks an employment is missing in data held by HMRC, they can add it. In software, this is done by calling the [Add a Custom Employment](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1{nino}~1{taxYear}/post) endpoint. After adding an employment, the customer needs to add the appropriate financial details for that employment. In software, this is done by calling the [Create and Amend Employment Financial Details](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1{nino}~1{taxYear}~1{employmentId}~1financial-details/put) endpoint. 

If a customer thinks that the financial details are incorrect for an employer in data held by HMRC, they can update it using the same endpoint. If the customer also thinks their non-financial details or other employment details are inaccurate, they can amend it. In software, this is done by calling the [Amend a Custom Employment](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1{nino}~1{taxYear}~1{employmentId}/put) or [Create and Amend Other Employment Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Other-Employment-Income/paths/~1individuals~1income-received~1employments~1other~1{nino}~1{taxYear}/put) endpoint respectively.

#### Delete employment details

The following endpoints allow the customer to delete different types of employment details:

- [Delete Employment Financial Details](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1{nino}~1{taxYear}~1{employmentId}~1financial-details/delete)
- [Delete Other Employment Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Other-Employment-Income/paths/~1individuals~1income-received~1employments~1other~1{nino}~1{taxYear}/delete)
- [Ignore Employment](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1{nino}~1{taxYear}~1{employmentId}~1ignore/post)
- [Unignore Employment](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1{nino}~1{taxYear}~1{employmentId}~1unignore/post)

If a customer has incorrect employment details, they can delete them. This can be done only at the end of the tax year. In the software, this is done by calling the [Delete Employment Financial Details](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1{nino}~1{taxYear}~1{employmentId}~1financial-details/delete) or [Delete Other Employment Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Other-Employment-Income/paths/~1individuals~1income-received~1employments~1other~1{nino}~1{taxYear}/delete) endpoint, depending on the detail type.

For some incorrect employment details held by HMRC, the customer can ask HMRC to ignore this information. In software, this is done by calling the [Ignore Employment](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1{nino}~1{taxYear}~1{employmentId}~1ignore/post) endpoint. This action can be reversed by using the [Unignore Employment](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Employments/paths/~1individuals~1income-received~1employments~1{nino}~1{taxYear}~1{employmentId}~1unignore/post) endpoint.

### Employment expenses

Customers can claim tax relief on certain expenses related to their work. For more information, refer to [Claim tax relief for your job expenses (GOV.UK).](https://www.gov.uk/tax-relief-for-employees) 

Customers can use their software to claim tax relief on the following types of expenses related to their employment:

- travel, vehicle, clothing, uniform, equipment or tools costs
- annual subscriptions paid to approved professional bodies relevant to their work

The software can use the following endpoints to enable customers to:

- [Create and Amend Employment Expenses](/api-documentation/docs/api/service/individuals-expenses-api/2.0/oas/page#tag/Employment-Expenses/paths/~1individuals~1expenses~1employments~1{nino}~1{taxYear}/put)
- [Retrieve Employment Expenses](/api-documentation/docs/api/service/individuals-expenses-api/2.0/oas/page#tag/Employment-Expenses/paths/~1individuals~1expenses~1employments~1{nino}~1{taxYear}/get)
- [Delete Employment Expenses](/api-documentation/docs/api/service/individuals-expenses-api/2.0/oas/page#tag/Employment-Expenses/paths/~1individuals~1expenses~1employments~1{nino}~1{taxYear}/delete)
- [Ignore Employment Expenses](/api-documentation/docs/api/service/individuals-expenses-api/2.0/oas/page#tag/Employment-Expenses/paths/~1individuals~1expenses~1employments~1{nino}~1{taxYear}~1ignore/post)

Customers can also use their software to claim tax relief on other types of expenses related to their work:

- annual subscriptions paid to an approved trade union or friendly society that entitle the customer to a pension, life assurance, or death benefits
- non-annual UK [patent royalty payments (GOV.UK)](https://www.gov.uk/hmrc-internal-manuals/savings-and-investment-manual/saim9130)

 The software can use the following endpoints to enable customers to:

* [Retrieve Other Expenses](/api-documentation/docs/api/service/individuals-expenses-api/2.0/oas/page#tag/Other-Expenses/paths/~1individuals~1expenses~1other~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Other Expenses](/api-documentation/docs/api/service/individuals-expenses-api/2.0/oas/page#tag/Other-Expenses/paths/~1individuals~1expenses~1other~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Other Expenses](/api-documentation/docs/api/service/individuals-expenses-api/2.0/oas/page#tag/Other-Expenses/paths/~1individuals~1expenses~1other~1%7Bnino%7D~1%7BtaxYear%7D/delete)

### Non-PAYE income

Customers might need to pay taxes on any tips they have received. For more information about paying taxes on tips, refer to [Tips at work (GOV.UK)](https://www.gov.uk/tips-at-work).

Customers can use their software to submit information about tips they have received through their employment. The software can use the following endpoints to enable customers to:

* [Create and Amend Non-PAYE Employment Income](/api-documentation/docs/api/service/individuals-employments-income-api/1.0/oas/page#tag/Non-PAYE-Employment-Income/paths/~1individuals~1employments-income~1non-paye~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Retrieve Non-PAYE Employment Income](/api-documentation/docs/api/service/individuals-employments-income-api/1.0/oas/page#tag/Non-PAYE-Employment-Income/paths/~1individuals~1employments-income~1non-paye~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Delete Non-PAYE Employment Income](/api-documentation/docs/api/service/individuals-employments-income-api/1.0/oas/page#tag/Non-PAYE-Employment-Income/paths/~1individuals~1employments-income~1non-paye~1%7Bnino%7D~1%7BtaxYear%7D/delete)

### Dividends Income

Customers might get a dividend if they own shares in a company. They must pay tax on dividend income if it is above their personal allowance. For more information, refer to [Tax on dividends (GOV.UK)](https://www.gov.uk/tax-on-dividends).

Customers can use their software to submit different types of dividend income. This includes UK dividend income, foreign dividend income, stock dividend income, redeemable shares income, bonus securities, dividend income received while abroad and close company loans written off.

The software can use the following endpoints to enable customers to:

- [Create and Amend Dividends Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Dividends-Income/paths/~1individuals~1income-received~1dividends~1{nino}~1{taxYear}/put)
- [Create and Amend a UK Dividends Income Annual Summary](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/UK-Dividends-Income/paths/~1individuals~1income-received~1uk-dividends~1{nino}~1{taxYear}/put)
- [Retrieve Dividends Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Dividends-Income/paths/~1individuals~1income-received~1dividends~1{nino}~1{taxYear}/get) 
- [Retrieve a UK Dividends Income Annual Summary](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/UK-Dividends-Income/paths/~1individuals~1income-received~1uk-dividends~1{nino}~1{taxYear}/get)
- [Delete Dividends Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Dividends-Income/paths/~1individuals~1income-received~1dividends~1{nino}~1{taxYear}/delete)
- [Delete a UK Dividends Income Annual Summary](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/UK-Dividends-Income/paths/~1individuals~1income-received~1uk-dividends~1{nino}~1{taxYear}/delete)

### Foreign Income

Foreign income is any income earned outside England, Wales, Scotland and Northern Ireland. The Channel Islands and the Isle of Man are classed as foreign. 

Customers might need to pay UK income tax on their foreign income. This includes wages if they work abroad, foreign investment income and income from pensions held overseas. For more information about tax on foreign income, refer to [Tax on foreign income (GOV.UK)](https://www.gov.uk/tax-foreign-income).

Customers can use their software to submit information about foreign earnings and unremittable foreign income. The software can use the following endpoints to enable customers to:

- [Create and Amend Foreign Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Foreign-Income/paths/~1individuals~1income-received~1foreign~1{nino}~1{taxYear}/put)
- [Retrieve Foreign Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Foreign-Income/paths/~1individuals~1income-received~1foreign~1{nino}~1{taxYear}/get)
- [Delete Foreign Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Foreign-Income/paths/~1individuals~1income-received~1foreign~1{nino}~1{taxYear}/delete)

### Insurance Policies Income

Income from insurance policies is any chargeable gains from UK life insurance policies. This includes cash or other benefits received on a full or part surrender of a policy, a policy matured or brought to an end by the death of the life insured, the sale or assignment of a UK policy, or part of a policy. For more information about insurance policies income tax, refer to [Insurance Policyholder Taxation Manual (GOV.UK)](https://www.gov.uk/hmrc-internal-manuals/insurance-policyholder-taxation-manual).

Customers can use their software to submit different types of insurance policies income. This includes information about life insurance policies, capital redemption policies, life annuities, voided ISAs, and foreign policies.

The software can use the following endpoints to enable customers to:

- [Create and Amend Insurance Policies Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Insurance-Policies-Income/paths/~1individuals~1income-received~1insurance-policies~1{nino}~1{taxYear}/put)
- [Retrieve Insurance Policies Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Insurance-Policies-Income/paths/~1individuals~1income-received~1insurance-policies~1{nino}~1{taxYear}/get)
- [Delete Insurance Policies Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Insurance-Policies-Income/paths/~1individuals~1income-received~1insurance-policies~1{nino}~1{taxYear}/delete)

### Pensions Income

Customers in receipt of foreign pensions must continue to report this income to HMRC. For more information about these income types, refer to [Self Assessment: Foreign (SA106) (GOV.UK)](https://www.gov.uk/government/publications/self-assessment-foreign-sa106). Customers should also tell HMRC about their overseas pension. For more information, refer to [Self Assessment: additional information SA101 (GOV.UK)](https://www.gov.uk/government/publications/self-assessment-additional-information-sa101).

Customers can use their software to submit the information above. The software can use the following endpoints to enable customers to:

* [Retrieve Pensions Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Pensions-Income/paths/~1individuals~1income-received~1pensions~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Pensions Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Pensions-Income/paths/~1individuals~1income-received~1pensions~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Pensions Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Pensions-Income/paths/~1individuals~1income-received~1pensions~1%7Bnino%7D~1%7BtaxYear%7D/delete)

### Other Income

Customers should tell HMRC about their other taxable income. This includes miscellaneous income like casual earnings, commission or freelance income.

Customers can use their software to submit different types of other income. This includes information about business receipts, all other income received while abroad, overseas income and gains, chargeable foreign benefits and gifts and omitted foreign income.

The software can use the following endpoints to enable customers to:

* [Retrieve Other Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Other-Income/paths/~1individuals~1income-received~1other~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Other Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Other-Income/paths/~1individuals~1income-received~1other~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Other Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Other-Income/paths/~1individuals~1income-received~1other~1%7Bnino%7D~1%7BtaxYear%7D/delete)

### Savings Income

Savings income can include interest for certain securities and income from overseas savings. For more information, refer to [How to complete your tax return for Self Assessment (GOV.UK)](https://www.gov.uk/government/publications/self-assessment-tax-return-sa100#supplementary-pages).

Customers can use their software to submit information about savings income. The software can use the following endpoints to enable customers to:

* [Retrieve Savings Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Savings-Income/paths/~1individuals~1income-received~1savings~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Savings Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Savings-Income/paths/~1individuals~1income-received~1savings~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Savings Income](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Savings-Income/paths/~1individuals~1income-received~1savings~1%7Bnino%7D~1%7BtaxYear%7D/delete)

### Savings Accounts

Customers must submit information to HMRC about any UK savings accounts they hold. For information about eligible account types, refer to [How to complete your tax return for Self Assessment (GOV.UK)](https://www.gov.uk/government/publications/self-assessment-tax-return-sa100#supplementary-pages).

Customers can use their software to submit information about each account and record the annual interest income data for it. The software can use the following endpoints to enable customers to:

- [Add a UK Savings Account](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/UK-Savings-Account/paths/~1individuals~1income-received~1savings~1uk-accounts~1{nino}/post)
- [Create and Amend a UK Savings Account Annual Summary](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/UK-Savings-Account/paths/~1individuals~1income-received~1savings~1uk-accounts~1{nino}~1{taxYear}~1{savingsAccountId}/put)
- [List All UK Savings Accounts](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/UK-Savings-Account/paths/~1individuals~1income-received~1savings~1uk-accounts~1{nino}/get)
- [Retrieve UK Savings Account Annual Summary](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/UK-Savings-Account/paths/~1individuals~1income-received~1savings~1uk-accounts~1{nino}~1{taxYear}~1{savingsAccountId}/get)

### Disclosures

Customers should tell HMRC if they think they have not paid the correct amount of tax. In serious cases of undisclosed tax or income, HMRC may consider starting a criminal investigation. 

Customers are encouraged to voluntarily tell HMRC about any failures or errors rather than wait for HMRC to contact them. This might reduce any potential penalties on outstanding tax. For more information about making disclosures, refer to [How to make a voluntary disclosure to HMRC (GOV.UK)](https://www.gov.uk/government/publications/hmrc-your-guide-to-making-a-disclosure/your-guide-to-making-a-disclosure).

Customers can use their software to submit disclosures about tax avoidance. The software can use the following endpoints to enable customers to:

* [Create and Amend Disclosures](/api-documentation/docs/api/service/individuals-disclosures-api/1.0/oas/page#tag/Disclosures/paths/~1individuals~1disclosures~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Retrieve Disclosures](/api-documentation/docs/api/service/individuals-disclosures-api/1.0/oas/page#tag/Disclosures/paths/~1individuals~1disclosures~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Delete Disclosures](/api-documentation/docs/api/service/individuals-disclosures-api/1.0/oas/page#tag/Disclosures/paths/~1individuals~1disclosures~1%7Bnino%7D~1%7BtaxYear%7D/delete)

### Individual Charges

This currently applies only to a customer’s pension charges. For more information, refer to [Pension savings - tax charges (GOV.UK)](https://www.gov.uk/government/publications/pensions-tax-charges-on-any-excess-over-the-lifetime-allowance-annual-allowance-special-annual-allowance-and-on-unauthorised-payments-hs345-self).

Customers can use their software to submit different types of pension charges. This includes UK and overseas pension contributions, tax on unauthorised payments, transfer of overseas pension to another pension scheme and tax paid for exceeding their lifetime allowance.

The software can use the following endpoints to enable customers to:

* [Retrieve Pension Charges](/api-documentation/docs/api/service/individuals-charges-api/2.0/oas/page#/paths/~1individuals~1charges~1pensions~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Pension Charges](/api-documentation/docs/api/service/individuals-charges-api/2.0/oas/page#/paths/~1individuals~1charges~1pensions~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Pension Charges](/api-documentation/docs/api/service/individuals-charges-api/2.0/oas/page#/paths/~1individuals~1charges~1pensions~1%7Bnino%7D~1%7BtaxYear%7D/delete)

### Individual Reliefs

‘Tax relief’ means that you either:

- pay less tax to take account of money you have spent on specific things, such as business expenses if you’re self-employed
- get tax back or get it repaid in another way, such as personal pension payments

For more information about individual tax reliefs, refer to [Tax reliefs (GOV.UK)](https://www.gov.uk/government/publications/self-assessment-tax-return-sa100/how-to-fill-in-your-tax-return-2021#tax-reliefs). The following sections cover the different types of tax reliefs and the endpoints needed to submit in the  software.

#### Pensions relief

Customers can use their software to submit different types of pension relief. This includes regular pension contributions, one-off pension contributions, retirement annuity payments, payments to employer’s scheme, and overseas pensions contributions.

The software can use the following endpoints to enable customers to:

* [Retrieve Pensions Reliefs](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Pensions-Reliefs/paths/~1individuals~1reliefs~1pensions~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Pensions Reliefs](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Pensions-Reliefs/paths/~1individuals~1reliefs~1pensions~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Pensions Reliefs](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Pensions-Reliefs/paths/~1individuals~1reliefs~1pensions~1%7Bnino%7D~1%7BtaxYear%7D/delete)

#### Relief investments

Customers can use their software to submit different types of relief investments. This includes venture capital subscriptions, Enterprise Investment Scheme (EIS), community investments, seed enterprise investments, and social enterprise investments.

The software can use the following endpoints to enable customers to:

* [Retrieve Relief Investments](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Relief-Investments/paths/~1individuals~1reliefs~1investment~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Relief Investments](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Relief-Investments/paths/~1individuals~1reliefs~1investment~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Relief Investments](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Relief-Investments/paths/~1individuals~1reliefs~1investment~1%7Bnino%7D~1%7BtaxYear%7D/delete)

#### Other reliefs

Customers can use their software to submit other types of tax relief. This includes non-deductible loan interests, payroll giving, redemption of shares and securities, maintenance payments, post-cessation trade relief, annual payments made, and qualifying loan interest payments.

The software can use the following endpoints to enable customers to:

* [Retrieve Other Reliefs](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Other-Reliefs/paths/~1individuals~1reliefs~1other~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Other Reliefs](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Other-Reliefs/paths/~1individuals~1reliefs~1other~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Other Reliefs](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Other-Reliefs/paths/~1individuals~1reliefs~1other~1%7Bnino%7D~1%7BtaxYear%7D/delete)

#### Foreign reliefs

Customers can use their software to submit different types of foreign relief. This includes foreign tax credit, foreign income tax credit, and foreign tax not claimed.

The software can use the following endpoints to enable customers to:

* [Retrieve Foreign Reliefs](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Foreign-Reliefs/paths/~1individuals~1reliefs~1foreign~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Foreign Reliefs](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Foreign-Reliefs/paths/~1individuals~1reliefs~1foreign~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Foreign Reliefs](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Foreign-Reliefs/paths/~1individuals~1reliefs~1foreign~1%7Bnino%7D~1%7BtaxYear%7D/delete)

#### Charitable giving

Customers can use their software to submit information about gifts and gift aid payments to non-UK charities. The software can use the following endpoints to enable customers to:

- [Retrieve Charitable Giving Tax Relief](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Charitable-Givings/paths/~1individuals~1reliefs~1charitable-giving~1{nino}~1{taxYear}/get)
- [Create and Amend Charitable Giving Tax Relief](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Charitable-Givings/paths/~1individuals~1reliefs~1charitable-giving~1{nino}~1{taxYear}/put)
- [Delete Charitable Giving Tax Relief](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Charitable-Givings/paths/~1individuals~1reliefs~1charitable-giving~1{nino}~1{taxYear}/delete)

### Other Deductions

This currently applies only to people working at sea outside of the UK. For more information, refer to [Seafarers Earnings Deduction: tax relief if you work on a ship (GOV.UK)](https://www.gov.uk/guidance/seafarers-earnings-deduction-tax-relief-if-you-work-on-a-ship).

Customers can use their software to submit information about seafarers. The software can use the following endpoints to enable customers to:

* [Retrieve Deductions](/api-documentation/docs/api/service/other-deductions-api/1.0/oas/page#/paths/~1individuals~1deductions~1other~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Deductions](/api-documentation/docs/api/service/other-deductions-api/1.0/oas/page#/paths/~1individuals~1deductions~1other~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Deductions](/api-documentation/docs/api/service/other-deductions-api/1.0/oas/page#/paths/~1individuals~1deductions~1other~1%7Bnino%7D~1%7BtaxYear%7D/delete)

### State Benefits

State benefits are sums of money paid by the government to people in certain circumstances to help meet their day-to-day living needs. They exist to make sure no one falls below a minimum standard of living. State benefits are sometimes called allowances, pensions, tax credits or entitlements. For more information, refer to [Tax-free and taxable state benefits (GOV.UK)](https://www.gov.uk/income-tax/taxfree-and-taxable-state-benefits).

Customers can use their software to submit information about incapacity benefits, state pension lump sums and other state benefits. The software can use the following endpoints to enable customers to:

* [List State Benefits](/api-documentation/docs/api/service/individuals-state-benefits-api/1.0/oas/page#/paths/~1individuals~1state-benefits~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create State Benefit](/api-documentation/docs/api/service/individuals-state-benefits-api/1.0/oas/page#/paths/~1individuals~1state-benefits~1%7Bnino%7D~1%7BtaxYear%7D/post)
* [Amend State Benefit](/api-documentation/docs/api/service/individuals-state-benefits-api/1.0/oas/page#/paths/~1individuals~1state-benefits~1%7Bnino%7D~1%7BtaxYear%7D~1%7BbenefitId%7D/put)
* [Delete State Benefit](/api-documentation/docs/api/service/individuals-state-benefits-api/1.0/oas/page#/paths/~1individuals~1state-benefits~1%7Bnino%7D~1%7BtaxYear%7D~1%7BbenefitId%7D/delete)
* [Amend State Benefit Amounts](/api-documentation/docs/api/service/individuals-state-benefits-api/1.0/oas/page#/paths/~1individuals~1state-benefits~1%7Bnino%7D~1%7BtaxYear%7D~1%7BbenefitId%7D~1amounts/put)
* [Delete State Benefit Amounts](/api-documentation/docs/api/service/individuals-state-benefits-api/1.0/oas/page#/paths/~1individuals~1state-benefits~1%7Bnino%7D~1%7BtaxYear%7D~1%7BbenefitId%7D~1amounts/delete)
* [Ignore State Benefit](/api-documentation/docs/api/service/individuals-state-benefits-api/1.0/oas/page#/paths/~1individuals~1state-benefits~1%7Bnino%7D~1%7BtaxYear%7D~1%7BbenefitId%7D~1ignore/post)
* [Unignore State Benefit](/api-documentation/docs/api/service/individuals-state-benefits-api/1.0/oas/page#/paths/~1individuals~1state-benefits~1%7Bnino%7D~1%7BtaxYear%7D~1%7BbenefitId%7D~1unignore/post)

### Capital Gains Tax

Capital Gains Tax is a tax on the profit when someone sells or disposes of an asset that has increased in value. Customers may need to report on the following types of asset:

* residential property
* other property 
* listed and unlisted shares and securities 

For more information about Capital Gains Tax, refer to [Capital Gains Tax: what you pay it on, rates and allowances (GOV.UK)](https://www.gov.uk/capital-gains-tax).

MTD customers can also report any losses they have made. This charge may be set against earlier or later years. When the customer sells or disposes of the whole or part of a UK residential property and is liable to pay CGT, they must tell HMRC within a specific time following the date of completion of the sale. For more information about the reporting requirement, refer to [Report and pay your Capital Gains Tax: If you sold a property in the UK on or after 6 April 2020 (GOV.UK)](https://www.gov.uk/report-and-pay-your-capital-gains-tax/if-you-sold-a-property-in-the-uk-on-or-after-6-april-2020). For non-resident customers, refer to [Tell HMRC about Capital Gains Tax on UK property or land if you’re not a UK resident (GOV.UK)](https://www.gov.uk/guidance/capital-gains-tax-for-non-residents-uk-residential-property), which advises on how these gains must be reported in year.

The customer can create, update, or delete their capital gains tax in software only after the end of the tax year. If they need to make changes during the year, they need to use [HMRC online services](/guides/income-tax-mtd-end-to-end-service-guide/documentation/tasks-outside-mtd-software.html#hmrc-online-services). In some cases, customers must report and pay before they submit their final declaration. However, this information will still need to be included in their final declaration if they are a Self Assessment or MTD customer.

An MTD customer can do the following: 

* view CGT Residential Property Disposals for personal property disposal (PPD), non-PPD and other capital gains and disposals
* create or amend CGT Residential Property Disposals for PPD, non-PPD and other capital gains and disposals
* delete CGT Residential Property Disposals for PPD, non-PPD and other capital gains and disposals

#### Viewing CGT

At any time, a customer can view their capital gains tax information. In software, this information is retrieved using the following endpoints:

* [Retrieve All CGT Residential Property Disposals and Overrides (Includes PPD and Non-PPD)](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Capital-Gains-on-Residential-Property-Disposals/paths/~1individuals~1income-received~1disposals~1residential-property~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Retrieve Other Capital Gains and Disposals](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Other-Capital-Gains-and-Disposals/paths/~1individuals~1income-received~1disposals~1other-gains~1%7Bnino%7D~1%7BtaxYear%7D/get)

#### Creating or Amending CGT

Customers can create or amend the different types of CGT information after the end of the tax year. This change must be done before they submit their final declaration. In software, this information is updated using the following endpoints:

* [Create and Amend ‘Report and Pay Capital Gains Tax on Property’ Overrides](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Capital-Gains-on-Residential-Property-Disposals/paths/~1individuals~1income-received~1disposals~1residential-property~1%7Bnino%7D~1%7BtaxYear%7D~1ppd/put)
* [Create and Amend CGT Residential Property Disposals](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Capital-Gains-on-Residential-Property-Disposals/paths/~1individuals~1income-received~1disposals~1residential-property~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Create and Amend Other Capital Gains and Disposals](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Other-Capital-Gains-and-Disposals/paths/~1individuals~1income-received~1disposals~1other-gains~1%7Bnino%7D~1%7BtaxYear%7D/put)

#### Deleting CGT

Customers can delete different types of CGT only after the end of the tax year and only after they have created CGT using software. However, this change must be done before they submit their final declaration.  In software, this deletion is made using the following endpoints:

* [Delete ‘Report and Pay Capital Gains Tax on Residential Property’ Overrides](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Capital-Gains-on-Residential-Property-Disposals/paths/~1individuals~1income-received~1disposals~1residential-property~1%7Bnino%7D~1%7BtaxYear%7D~1ppd/delete)
* [Delete CGT Residential Property Disposals](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Capital-Gains-on-Residential-Property-Disposals/paths/~1individuals~1income-received~1disposals~1residential-property~1%7Bnino%7D~1%7BtaxYear%7D/delete)
* [Delete Other Capital Gains and Disposals](/api-documentation/docs/api/service/individuals-income-received-api/2.0/oas/page#tag/Other-Capital-Gains-and-Disposals/paths/~1individuals~1income-received~1disposals~1other-gains~1%7Bnino%7D~1%7BtaxYear%7D/delete)

### Marriage Allowance

Marriage Allowance allows the customer to transfer some of their Personal Allowance to their husband, wife or civil partner. This will reduce the customer's tax in the next tax year (6 April to 5 April). For more information about marriage allowance, refer to [Marriage Allowance: How it works - GOV.UK](https://www.gov.uk/marriage-allowance).

Customers can create a Marriage Allowance claim using their name, date of birth and National Insurance number. To do this action, the software must call the [Create Marriage Allowance](/api-documentation/docs/api/service/individuals-disclosures-api/1.0/oas/page#tag/Marriage-Allowance/paths/~1individuals~1disclosures~1marriage-allowance~1{nino}/post) endpoint in the [Individuals Disclosures API](/api-documentation/docs/api/service/individuals-disclosures-api/). After the claim has been accepted by HMRC, the customer can view their Marriage Allowance in their tax calculations.

## Submit allowance and adjustments

Some customers must submit an annual summary update. An annual summary is defined as a set of summary data for a tax year, containing allowances and adjustments broken down by category. They can provide updates more frequently if they wish, though they must make this submission before submitting their final declaration. The following endpoints enable customers to submit their annual allowances or adjustments: 

- [Create and Amend Self-Employment Annual Submission](/api-documentation/docs/api/service/self-employment-business-api/3.0/oas/page#tag/Self-Employment-Annual-Submission/paths/~1individuals~1business~1self-employment~1{nino}~1{businessId}~1annual~1{taxYear}/put)
- [Create and Amend a UK Property Business Annual Submission](/api-documentation/docs/api/service/property-business-api/3.0/oas/page#tag/UK-Property-Business-Annual-Submission/paths/~1individuals~1business~1property~1uk~1{nino}~1{businessId}~1annual~1{taxYear}/put)
- [Create and Amend a Foreign Property Annual Submission](/api-documentation/docs/api/service/property-business-api/3.0/oas/page#tag/Foreign-Property-Annual-Submission/paths/~1individuals~1business~1property~1foreign~1{nino}~1{businessId}~1annual~1{taxYear}/put)
- [Create and Amend Historic FHL UK Property Business Annual Submission](/api-documentation/docs/api/service/property-business-api/3.0/oas/page#tag/Historic-FHL-UK-Property-Business-Annual-Submission/paths/~1individuals~1business~1property~1uk~1annual~1furnished-holiday-lettings~1{nino}~1{taxYear}/put)
- [Create and Amend Historic Non-FHL UK Property Business Annual Submission](/api-documentation/docs/api/service/property-business-api/3.0/oas/page#tag/Historic-non-FHL-UK-Property-Business-Annual-Submission/paths/~1individuals~1business~1property~1uk~1annual~1non-furnished-holiday-lettings~1{nino}~1{taxYear}/put)

### View allowance and adjustments

Submitted updates can be viewed any time throughout the year. The following endpoints enable customers to view their submitted annual allowances or adjustments: 

- [Retrieve a Self-Employment Annual Submission](/api-documentation/docs/api/service/self-employment-business-api/3.0/oas/page#tag/Self-Employment-Annual-Submission/paths/~1individuals~1business~1self-employment~1{nino}~1{businessId}~1annual~1{taxYear}/get)
- [Retrieve a UK Property Business Annual Submission](/api-documentation/docs/api/service/property-business-api/3.0/oas/page#tag/UK-Property-Business-Annual-Submission/paths/~1individuals~1business~1property~1uk~1{nino}~1{businessId}~1annual~1{taxYear}/get)
- [Retrieve a Foreign Property Annual Submission](/api-documentation/docs/api/service/property-business-api/3.0/oas/page#tag/Foreign-Property-Annual-Submission/paths/~1individuals~1business~1property~1foreign~1{nino}~1{businessId}~1annual~1{taxYear}/get)
- [Retrieve a Historic FHL UK Property Business Annual Submission](/api-documentation/docs/api/service/property-business-api/3.0/oas/page#tag/Historic-FHL-UK-Property-Business-Annual-Submission/paths/~1individuals~1business~1property~1uk~1annual~1furnished-holiday-lettings~1{nino}~1{taxYear}/get)
- [Retrieve a Historic Non-FHL UK Property Business Annual Submission](/api-documentation/docs/api/service/property-business-api/3.0/oas/page#tag/Historic-non-FHL-UK-Property-Business-Annual-Submission/paths/~1individuals~1business~1property~1uk~1annual~1non-furnished-holiday-lettings~1{nino}~1{taxYear}/get)

### Amend allowance and adjustments

The software should use the same endpoints and process for submitting annual information as [Submit allowance and adjustment updates for SE and property businesses](/guides/income-tax-mtd-end-to-end-service-guide/documentation/businessandpropertyincome.html#submit-allowance-and-adjustment-updates-for-se-and-property-businesses).

When a customer amends an annual summary update, it is necessary to provide all previously submitted figures again in addition to any new information. This means all previous entries will be removed after the new submission. 

The customer can also delete their previously submitted annual allowance and adjustment updates. In software, this deletion is done by calling any of the following endpoints, depending on the business income type:

- [Delete a Self-Employment Annual Submission](/api-documentation/docs/api/service/self-employment-business-api/3.0/oas/page#tag/Self-Employment-Annual-Submission/paths/~1individuals~1business~1self-employment~1{nino}~1{businessId}~1annual~1{taxYear}/delete)
- [Delete a Property Annual Submission](/api-documentation/docs/api/service/property-business-api/3.0/oas/page#tag/UK-or-Foreign-Property-Annual-Submission-Deletion/paths/~1individuals~1business~1property~1{nino}~1{businessId}~1annual~1{taxYear}/delete)
- [Delete a Historic FHL UK Property Business Annual Submission](/api-documentation/docs/api/service/property-business-api/3.0/oas/page#tag/Historic-FHL-UK-Property-Business-Annual-Submission/paths/~1individuals~1business~1property~1uk~1annual~1furnished-holiday-lettings~1{nino}~1{taxYear}/delete)
- [Delete a Historic Non-FHL UK Property Business Annual Submission](/api-documentation/docs/api/service/property-business-api/3.0/oas/page#tag/Historic-non-FHL-UK-Property-Business-Annual-Submission/paths/~1individuals~1business~1property~1uk~1annual~1non-furnished-holiday-lettings~1{nino}~1{taxYear}/delete)

## Submit accounting adjustments

When the customer has submitted all quarterly updates, they may need to make an accounting adjustment to their income or expenses. They should first make changes to their digital records and then use the software to submit them to HMRC. The [Self Assessment BSAS (Business Source Adjustable Summary) API](/api-documentation/docs/api/service/self-assessment-bsas-api/) enables a customer to submit or retrieve an adjustable summary calculation for a specified self-employment or property business.

The adjustments should be submitted as a positive or negative amount. For example, if a customer has already submitted advertising costs of £250 but the figure should be £200, the adjustment required would be -50. Adjustments are always made against the total of the original quarterly updates. Each new adjustment will overwrite the previous adjustment as shown in the table below.

| | Original (total of all 4 quarters) | 1<sup>st</sup> adjustment | Revised total | 2<sup>nd</sup> adjustment | Revised total |
| --- | --- | --- | --- | --- | --- |
| premisesRunningCosts | 500 | 25 | 525 | 23 | 523 |
| travelCosts          | 600 | -17 | 583 | -20 | 580 |

To make an accounting adjustment, the software needs to call the [Trigger a Business Source Adjustable Summary](/api-documentation/docs/api/service/self-assessment-bsas-api/4.0/oas/page#/paths/~1individuals~1self-assessment~1adjustable-summary~1{nino}~1trigger/post) endpoint to receive the Calculation ID. The software will need to provide this Calculation ID when submitting any adjustments to HMRC using the following endpoints:

- [Submit Self-Employment Accounting Adjustments](/api-documentation/docs/api/service/self-assessment-bsas-api/4.0/oas/page#tag/Self-employment-business/paths/~1individuals~1self-assessment~1adjustable-summary~1{nino}~1self-employment~1{calculationId}~1adjust/post)
- [Submit UK Property Accounting Adjustments](/api-documentation/docs/api/service/self-assessment-bsas-api/4.0/oas/page#tag/UK-property-business/paths/~1individuals~1self-assessment~1adjustable-summary~1{nino}~1uk-property~1{calculationId}~1adjust/post)
- [Submit Foreign Property Accounting Adjustments](/api-documentation/docs/api/service/self-assessment-bsas-api/4.0/oas/page#tag/Foreign-property-business/paths/~1individuals~1self-assessment~1adjustable-summary~1{nino}~1foreign-property~1{calculationId}~1adjust/post)

When an adjustment has been made, the customer can view a summary. To retrieve this, the software should call any of the following endpoints, using the same Calculation ID:

- [Retrieve a Self-Employment Business Source Adjustable Summary (BSAS)](/api-documentation/docs/api/service/self-assessment-bsas-api/4.0/oas/page#tag/Self-employment-business/paths/~1individuals~1self-assessment~1adjustable-summary~1{nino}~1self-employment~1{calculationId}/get)[ ](/api-documentation/docs/api/service/self-assessment-bsas-api/4.0/oas/page#tag/Self-employment-business/paths/~1individuals~1self-assessment~1adjustable-summary~1{nino}~1self-employment~1{calculationId}~1adjust/post)
- [Retrieve a UK Property Business Source Adjustable Summary (BSAS)](/api-documentation/docs/api/service/self-assessment-bsas-api/4.0/oas/page#tag/UK-property-business/paths/~1individuals~1self-assessment~1adjustable-summary~1{nino}~1uk-property~1{calculationId}/get)
- [Retrieve a Foreign Property Business Source Adjustable Summary (BSAS)](/api-documentation/docs/api/service/self-assessment-bsas-api/4.0/oas/page#tag/Foreign-property-business/paths/~1individuals~1self-assessment~1adjustable-summary~1{nino}~1foreign-property~1{calculationId}/get)

## How to treat a loss

A self-employed business can have a loss when trade expenses are more than trade income. If the business has a loss for a year before signing up to Making Tax Digital, the customer or agent will need to submit details about the loss to be brought forward. For more information, refer to [HS227 Losses (GOV.UK).](https://www.gov.uk/government/publications/losses-hs227-self-assessment-helpsheet/hs227-losses-2023#using-losses-types-of-claim)

Customers can submit different types of losses through their software. This includes brought forward losses and capital gains losses. Brought forward losses can be calculated for the customer’s self-employment, UK property, and foreign property business income types. The software can use the following endpoints to enable customers to:

- [Create a brought forward loss](/api-documentation/docs/api/service/individual-losses-api/4.0/oas/page#tag/Brought-Forward-Losses/paths/~1individuals~1losses~1{nino}~1brought-forward-losses/post)
- [List brought forward losses](/api-documentation/docs/api/service/individual-losses-api/4.0/oas/page#tag/Brought-Forward-Losses/paths/~1individuals~1losses~1{nino}~1brought-forward-losses~1tax-year~1{taxYearBroughtForwardFrom}/get)
- [Amend a brought forward loss](/api-documentation/docs/api/service/individual-losses-api/4.0/oas/page#tag/Brought-Forward-Losses/paths/~1individuals~1losses~1{nino}~1brought-forward-losses~1{lossId}~1change-loss-amount/post)
- [Retrieve a brought forward loss](/api-documentation/docs/api/service/individual-losses-api/4.0/oas/page#tag/Brought-Forward-Losses/paths/~1individuals~1losses~1{nino}~1brought-forward-losses~1{lossId}/get)
- [Delete a brought forward loss](/api-documentation/docs/api/service/individual-losses-api/4.0/oas/page#tag/Brought-Forward-Losses/paths/~1individuals~1losses~1{nino}~1brought-forward-losses~1{lossId}/delete)

For capital gains losses, the software can use the following endpoints to enable customers to:

- [Create and Amend Other Capital Gains and Disposals](/api-documentation/docs/api/service/individuals-capital-gains-income-api/1.0/oas/page#tag/Other-Capital-Gains-and-Disposals/paths/~1individuals~1disposals-income~1other-gains~1%7Bnino%7D~1%7BtaxYear%7D/put)
- [Retrieve Other Capital Gains and Disposals](/api-documentation/docs/api/service/individuals-capital-gains-income-api/1.0/oas/page#tag/Other-Capital-Gains-and-Disposals/paths/~1individuals~1disposals-income~1other-gains~1%7Bnino%7D~1%7BtaxYear%7D/get)
- [Delete Other Capital Gains and Disposals](/api-documentation/docs/api/service/individuals-capital-gains-income-api/1.0/oas/page#tag/Other-Capital-Gains-and-Disposals/paths/~1individuals~1disposals-income~1other-gains~1%7Bnino%7D~1%7BtaxYear%7D/delete)

After submitting the above losses, customers can view their loss position. If they do not agree with that, they can submit an independent loss claim. The software can use the following endpoints to enable a customer to:

- [Create a Loss Claim](/api-documentation/docs/api/service/individual-losses-api/4.0/oas/page#tag/Loss-Claims/paths/~1individuals~1losses~1{nino}~1loss-claims/post)
- [List Loss Claims](/api-documentation/docs/api/service/individual-losses-api/4.0/oas/page#tag/Loss-Claims/paths/~1individuals~1losses~1{nino}~1loss-claims~1tax-year~1{taxYearClaimedFor}/get)
- [Retrieve a Loss Claim](/api-documentation/docs/api/service/individual-losses-api/4.0/oas/page#tag/Loss-Claims/paths/~1individuals~1losses~1{nino}~1loss-claims~1{claimId}/get)
- [Delete a Loss Claim](/api-documentation/docs/api/service/individual-losses-api/4.0/oas/page#tag/Loss-Claims/paths/~1individuals~1losses~1{nino}~1loss-claims~1{claimId}/delete)
- [Amend a Loss Claim Type](/api-documentation/docs/api/service/individual-losses-api/4.0/oas/page#tag/Loss-Claims/paths/~1individuals~1losses~1{nino}~1loss-claims~1{claimId}~1change-type-of-claim/post)
- [Amend Loss Claims Order](/api-documentation/docs/api/service/individual-losses-api/4.0/oas/page#tag/Loss-Claims/paths/~1individuals~1losses~1{nino}~1loss-claims~1order~1{taxYearClaimedFor}/put)

## Final declaration

Final declaration is the process that allows customers to finalise their tax position for any one tax year, taking into account all sources of chargeable income and gains, whether business income or otherwise. 

It is also the process by which most formal claims for reliefs and allowances and any deductions are made, where these were previously included within a Self Assessment tax return.

Customers are able to tell us at this point (subject to the existing limits) how they wish any losses available to them to be treated.

Customers can make a final declaration from 6 April Year 1. The deadline for final declaration is 31 January Year 2. The software should remind customers to help them to meet this deadline.

Before starting the final declaration journey, the software package must ensure that for the relevant tax year, the customer:

* has submitted quarterly update information for each business income source (self-employment and property income)
* has finalised EOPS for all their businesses (self-employment and property income)
* has already provided their entire income (for example, interest, dividends, other SA schedules)
* does not have any additional information to provide (for example, information about how to treat a loss)

If your software will not allow customers to report their entire income and reliefs, customers should be informed to report them using [HMRC online services](/guides/income-tax-mtd-end-to-end-service-guide/documentation/tasks-outside-mtd-software.html#hmrc-online-services).

### Making a final declaration

The software will have to let HMRC know that the customer is ready to submit a final declaration. To do this, you must call the [Trigger a Self Assessment Tax Calculation](/api-documentation/docs/api/service/individual-calculations-api/5.0/oas/page#tag/Tax-Calculations/paths/~1individuals~1calculations~1%7Bnino%7D~1self-assessment~1%7BtaxYear%7D/post) endpoint under the [Individual Calculations (MTD) API](/api-documentation/docs/api/service/individual-calculations-api) with the Final Declaration parameter set to 'true'. This has the following consequences: 

* it starts the final declaration process in HMRC 
* it triggers the business validation rules (which, if violated, produce errors rather than warnings) 
* it generates a final liability calculation and a Calculation ID
* the software must then quote the Calculation ID when retrieving the calculation output using the [Retrieve A Self Assessment Tax Calculation](/api-documentation/docs/api/service/individual-calculations-api/5.0/oas/page#tag/Tax-Calculations/paths/~1individuals~1calculations~1%7Bnino%7D~1self-assessment~1%7BtaxYear%7D~1%7BcalculationId%7D/get) endpoint

If the [Trigger a Self Assessment Tax Calculation](/api-documentation/docs/api/service/individual-calculations-api/5.0/oas/page#tag/Tax-Calculations/paths/~1individuals~1calculations~1{nino}~1self-assessment~1{taxYear}/post) does not pass HMRC validation, it results in an error. For more information, refer to [Tax calculations](/guides/income-tax-mtd-end-to-end-service-guide/documentation/tax-calculations). If it results in no errors, the results of the final declaration calculation are available to the software to show the customer.

If a customer thinks the calculation is incorrect based on the data they have submitted, they can go back and change the information by resubmitting the relevant update with the correct information. After they have done this, the software will have to call the [Trigger a Self Assessment Tax Calculation](/api-documentation/docs/api/service/individual-calculations-api/5.0/oas/page#tag/Tax-Calculations/paths/~1individuals~1calculations~1%7Bnino%7D~1self-assessment~1%7BtaxYear%7D/post) endpoint again to generate a new final liability.

If a customer does not agree with the calculation based on rules HMRC has used, they will need to contact HMRC before submitting their final declaration. If a software provider identifies a problem with the [Individual Calculations API](/api-documentation/docs/api/service/individual-calculations-api), they will need to contact [SDSTeam@hmrc.gov.uk](mailto:SDSTeam@hmrc.gov.uk).

If a customer thinks the calculation is correct, they can use the [Submit a Self Assessment Final Declaration](/api-documentation/docs/api/service/individual-calculations-api/5.0/oas/page#tag/Final-Declaration/paths/~1individuals~1calculations~1%7Bnino%7D~1self-assessment~1%7BtaxYear%7D~1%7BcalculationId%7D~1final-declaration/post) endpoint to submit their final declaration. 

**Note:** After a customer has submitted their final declaration, they will not currently be able to amend their submission using their software.

#### Agreeing to the declaration

After a customer is confident that they have submitted all the required income tax information through software and [HMRC online services](/guides/income-tax-mtd-end-to-end-service-guide/documentation/tasks-outside-mtd-software.html#hmrc-online-services), they will have to agree to a declaration and send it to HMRC. When using the software, this is done by using the [Submit a Self Assessment Final Declaration](/api-documentation/docs/api/service/individual-calculations-api/5.0/oas/page#tag/Final-Declaration/paths/~1individuals~1calculations~1%7Bnino%7D~1self-assessment~1%7BtaxYear%7D~1%7BcalculationId%7D~1final-declaration/post) endpoint.

 > **The Declaration**

> “Before you can submit the information displayed here in response to your notice to file from HM Revenue & Customs, you must read and agree to the following statement by

> [Here the vendor can decide how to manage the actual declaration in the user interface, for example a tick box, confirm button or other method]

> I declare that the information and self-assessment I have filed are (taken together) correct and complete to the best of my knowledge. I understand that I may have to pay financial penalties and face prosecution if I give false information.”

> **Declaration for Agents**

 > "I confirm that my client has received a copy of all the information being filed and approved the information as being correct and complete to the best of their knowledge and belief. My client understands that they may have to pay financial penalties and face prosecution if they give false information."

The software must send the Calculation ID that matches the specific calculation that the customer is agreeing to in the declaration.

### Final declaration user journey

<a href="figures/final-declaration-diagram.svg" target="blank"><img src="/figures/final-declaration-diagram.svg" alt="final declaration process API diagram" style="width:720px;" /></a>

<a href="figures/final-declaration-diagram.svg" target="blank">Open the final declaration process diagram in a new tab</a>.

1.	The customer is ready to complete their final declaration.
2.	The software calls the [Trigger a Self Assessment Tax Calculation](/api-documentation/docs/api/service/individual-calculations-api/5.0/oas/page#tag/Tax-Calculations/paths/~1individuals~1calculations~1%7Bnino%7D~1self-assessment~1%7BtaxYear%7D/post) endpoint with the Final Declaration parameter set to 'true'.
3.	HMRC receives the request, starts the tax calculation, and returns a Calculation ID.
4.	The software receives the Calculation ID.
5.	HMRC generates the final declaration tax calculation - this process will also convert any business validation warnings into errors. If there are any errors, the calculation will not run and the customer will not be able to declare the liability.
6.	HMRC Stores the tax calculation with the Calculation ID.
7.	The software uses the Calculation ID to receive details about the calculation or errors using the [Retrieve A Self Assessment Tax Calculation](/api-documentation/docs/api/service/individual-calculations-api/5.0/oas/page#tag/Tax-Calculations/paths/~1individuals~1calculations~1%7Bnino%7D~1self-assessment~1%7BtaxYear%7D~1%7BcalculationId%7D/get) endpoint.
8.	HMRC provides the calculation results in case of a successful call. If there are any validation errors, the customer will not be able to view the calculation results.
9.	The software must make the calculation results available to the customer – at this point in the journey, it is mandatory that the customer is shown a copy of the calculation associated with the Calculation ID. As a minimum, a customer must view the equivalent of what is currently in the SA302.
10.	The customer reviews the calculation and the declaration text.
11.	The customer confirms the declaration and the software calls the [Submit a Self Assessment Final Declaration](/api-documentation/docs/api/service/individual-calculations-api/5.0/oas/page#tag/Final-Declaration/paths/~1individuals~1calculations~1%7Bnino%7D~1self-assessment~1%7BtaxYear%7D~1%7BcalculationId%7D~1final-declaration/post) endpoint using the Calculation ID to confirm the calculation to which the customer is agreeing.
12.	HMRC receives the submission, marks the obligation as fulfilled, and confirms receipt with a success code.
13.	The software receives a success code (HTTP 204) and the software needs to confirm to the customer that HMRC has received the return because HMRC will not communicate this to the customer.
14.	The customer views confirmation that the return has been successfully submitted to HMRC.

## Making amendments after submitting a final declaration

If a customer wants to make any changes following a final declaration, they have 12 months from the statutory filing date to do this (the statutory filing date is 31 January following the end of the tax year). They can make these changes by following the existing [Self Assessment tax returns amendment process](https://www.gov.uk/self-assessment-tax-returns/corrections). These amendments cannot currently be made using software.

**Note:** Any changes made after final declaration will be a formal amendment under section 9ZA TMA 1970.

## Using tax codes to collect tax due

When a Self Assessment customer receives PAYE income in addition to business income, HMRC will try to collect any Self Assessment tax owed through their tax code for the following tax year.

However, if there is a change in the customer's tax code, it may no longer be possible to collect the tax owed using this method. As a result, any amount collected will be returned to the customer’s account. For more information, refer to [Pay your Self Assessment tax bill: Through your tax code (GOV.UK)](https://www.gov.uk/pay-self-assessment-tax-bill/through-your-tax-code).

‘Coding out’ refers to the use of tax codes to collect tax and debts due to HMRC. The coding out underpayments and debts endpoints in the [Self Assessment Accounts API](/api-documentation/docs/api/service/self-assessment-accounts-api/) enable the customer to complete the following tasks: 

- view coding out underpayment and debt amounts
- create or amend coding out underpayment and debt amounts
- delete coding out underpayment and debt amounts

A customer can view the coded out Self Assessment underpayments stored by HMRC and the amount submitted for the previous tax year at any time. In the software, this is done by calling the [Retrieve Coding Out Underpayments and Debt Amounts](/api-documentation/docs/api/service/self-assessment-accounts-api/2.0/oas/page#tag/Coding-Out-Underpayments-and-Debts/paths/~1accounts~1self-assessment~1%7Bnino%7D~1%7BtaxYear%7D~1collection~1tax-code/get) endpoint.

At the end of the tax year, the customer will review their calculations before submitting the final declaration. If the customer does not agree with the coded out amount in their calculation shown by HMRC, they can submit what they believe to be the correct coded out amount. This can be corrected more than once if needed, but it needs to be done before the final declaration is submitted. In the software, this amendment is done by calling the [Create or Amend Coding Out Underpayments and Debt Amounts](/api-documentation/docs/api/service/self-assessment-accounts-api/2.0/oas/page#tag/Coding-Out-Underpayments-and-Debts/paths/~1accounts~1self-assessment~1%7Bnino%7D~1%7BtaxYear%7D~1collection~1tax-code/put) endpoint. This endpoint can be used only after the tax year has ended.

If the customer has submitted an amendment to the coded out amount after the end of the tax year but later realises they agree with the coded out amount shown by HMRC, they can delete their submitted amount. This deletion needs to be done before the final declaration is submitted. In the software, this deletion is done by calling the [Delete Coding Out Underpayments and Debt Amounts](/api-documentation/docs/api/service/self-assessment-accounts-api/2.0/oas/page#tag/Coding-Out-Underpayments-and-Debts/paths/~1accounts~1self-assessment~1%7Bnino%7D~1%7BtaxYear%7D~1collection~1tax-code/delete) endpoint.

Coding out is specific to the tax year. If a customer opts out of coding out for a specific tax year, they will not be opted out for future tax years. 

The software can use the following endpoints to enable customers to:

- [Opt Out of Coding Out](/api-documentation/docs/api/service/self-assessment-accounts-api/3.0/oas/page#tag/Coding-Out-Status/paths/~1accounts~1self-assessment~1{nino}~1{taxYear}~1collection~1tax-code~1coding-out~1opt-out/post) 
- [Retrieve Coding Out Status](/api-documentation/docs/api/service/self-assessment-accounts-api/3.0/oas/page#tag/Coding-Out-Status/paths/~1accounts~1self-assessment~1{nino}~1{taxYear}~1collection~1tax-code~1coding-out~1status/get)
- [Opt in to Coding Out](/api-documentation/docs/api/service/self-assessment-accounts-api/3.0/oas/page#tag/Coding-Out-Status/paths/~1accounts~1self-assessment~1{nino}~1{taxYear}~1collection~1tax-code~1coding-out~1opt-in/post)

## Penalties and appeals

### Penalties for late payment and late submission

The way that HMRC penalises ITSA late payments and late submissions will be changing. The changes, referred to as 'Penalty Reform for ITSA', will apply to ITSA customers from the tax year in which they become mandated to join MTD. More information will follow as it is made available.

For tax years prior to the changes, the existing late payment and late filing penalties continue to apply. You can find more information about these penalties on gov.uk:

- [Penalties for late filing of Self Assessment tax returns](https://www.gov.uk/self-assessment-tax-returns/penalties)
- [Self Assessment: how to appeal against penalties for late filing and late payment](https://www.gov.uk/government/publications/self-assessment-appeal-against-penalties-for-late-filing-and-late-payment-sa370/self-assessment-how-to-appeal-against-penalties-for-late-filing-and-late-payment)

### Other penalties

Other penalties that apply to ITSA customers are unchanged by Penalty Reform and will continue to be charged where appropriate. These include:

- [Inaccuracy penalties - Factsheet CC/FS7a](https://www.gov.uk/government/publications/compliance-checks-penalties-for-inaccuracies-in-returns-or-documents-ccfs7a)
- [Penalties for not telling HMRC about an under-assessment - Factsheet CC/FS7b](https://www.gov.uk/government/publications/compliance-checks-penalties-for-not-telling-hmrc-about-an-under-assessment-ccfs7b)
- [Penalties for failure to notify HMRC of a liability to tax - Factsheet CC/FS11](https://www.gov.uk/government/publications/compliance-checks-penalties-for-failure-to-notify-ccfs11)

### Paying penalties and interest

Penalties must be paid within 30 days of the date on the penalty notice. Late payment interest will be charged on penalties that are not paid on time.

### Appeals

The [existing process for appeals](https://www.gov.uk/tax-appeals/penalty) will remain in place, although a provision will be made as part of Penalty Reform to allow the user to appeal their late submission and late payment penalties through the digital tax account.

A customer or agent may contact HMRC if they have a query about a tax decision. If they don’t understand the decision they can also get advice from HMRC or professional help.
