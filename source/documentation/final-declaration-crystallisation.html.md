---
title: Final Declaration (Crystallisation)
weight: 4
description: Software developers, designers, product owners or business analysts. Integrate your software with the Income Tax API for Making Tax Digital.
---

<!--- Section owner: MTD Programme --->

# Final Declaration (Crystallisation)
**Note: The term 'final declaration' is now used instead of the term 'crystallisation'. Endpoints with 'crystallisation' or 'crystallise' in their names will continue to be used until further notice.**

Final declaration (previously called crystallisation) is the process that allows the customer to finalise their tax position for any one tax year, taking into account all sources of chargeable income and gains, whether business income or otherwise. In other words, this process brings together all the data that a taxpayer needs to provide to HMRC to reach their final tax liability for a specific year.

It is also the process by which most formal claims for reliefs and allowances and any deductions will be made, where these were previously included within a Self Assessment tax return.

Customers will also be able to tell us at this point (subject to the existing limits) how they wish any losses available to them to be treated.

Customers can submit a final declaration from 6 April Year 1. The deadline for submitting a final declaration is 31 January Year 2. The software should remind customers to help them to meet this deadline.

## Providing information about how to treat a loss

### Losses and claims

A self-employed business can have a loss when the trade expenses are more than the trade income.
If the business has a loss for a year prior to signing up to Making Tax Digital, the customer or agent will need to submit details of the loss to be brought forward.

<a href="figures/losses-api-diagram.svg" target="blank"><img src="figures/losses-api-diagram.svg" alt="Losses API calls" style="width:720px;" /></a>

<a href="figures/losses-api-diagram.svg" target="blank">Open the Losses diagram in a new tab</a>.

Vendors can use the [create a brought forward losses](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individual-losses-api/#brought-forward-losses_create-a-brought-forward-loss_post_accordion) endpoint to enable customers to submit the brought forward loss to HMRC.

When the loss detail has been submitted, or if a loss arises for a tax year following sign up to Making Tax Digital, a claim will need to be made to either:

* utilise the loss against an income source for a specific year, or
* claim to carry the loss forward so that it is available to use in later years

The [Loss claims](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individual-losses-api/#loss-claims) endpoint allows the user to do the following:

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

## Submit information about personal income
### Self-assessment return

The software should prompt customers to make sure they have considered the following potential additional income sources (there are links to the APIs where the functionality is available, we will continue to release additional functionality and update this page).

* any income from [bank or building society interest](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-api/#savings-accounts) (supported in live)
* any income from [dividends](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-api/#dividends-income) (supported in live)  
*	any [gift aid contributions](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-api/#charitable-giving) they have made (supported in live)  
*	any pension contributions
*	any pension income
*	capital gains
*	income from employment
*	additional information (currently provided on the SA101)
*	any income from partnerships
*	any income from trusts
*	any foreign income

Note:

Information currently provided through the existing self-assessment process: if a customer needs to report information to HMRC that is not yet supported under MTD or your software, they will need to complete a Self Assessment tax return.  Any information they have provided through MTD will not be considered and they will have to submit everything through the existing HMRC Self Assessment service.

## Final Declaration

The software will have to let HMRC know that the customer is ready to submit a final declaration, to do this you must call the [Trigger A Self Assessment Tax Calculation](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individual-calculations-api/3.0#Trigger%20A%20Self%20Assessment%20Tax%20Calculation) endpoint under the **Individual Calculations (MTD) API** with the ```finalDeclaration``` parameter set to true. This will start the final declaration process in HMRC. It will trigger the business validation rules (which will become errors rather than warnings) and generate a final liability calculation.

The response includes a ```calculationId```. The software will then have to retrieve the calculation using the ```calculationId``` to get the calculation output.

The Calculation ID output provides a summary of each income source (for example self-employment, UK property, foreign property and UK bank and building society interest), plus a breakdown of allowances and reliefs applied, and a breakdown of the Income Tax and NIC payable - broadly the equivalent of the current SA302.

As of v3.0, the results of the final declaration calculation are available at a single endpoint:

* [Retrieve A Self Assessment Tax Calculation](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individual-calculations-api/3.0#Retrieve%20Self%20Assessment%20Tax%20Calculation)

A final declaration Calculation ID will not always have a calculation result. It is possible that errors in previously submitted income data can prevent a calculation from being performed.

If calculation errors are present, these errors are returned in the response to the Retrieve a Self Assessment Tax Calculation endpoint.


<a href="figures/crystallisation-diagram.svg" target="blank"><img src="figures/crystallisation-diagram.svg" alt="crystallisation process API diagram" style="width:720px;" /></a>

<a href="figures/crystallisation-diagram.svg" target="blank">Open the final declaration process diagram in a new tab</a>.

1.	Customer is ready to complete their final tax return.
2.	The software calls the [Trigger A Self Assessment Tax Calculation](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individual-calculations-api/3.0#Trigger%20A%20Self%20Assessment%20Tax%20Calculation) endpoint with ```finalDeclaration``` as true – this triggers the creation of the final declaration calculation for the customer to agree.
3.	HMRC receives the request and starts the tax calculation and returns a Calculation ID.
4.	The software receives the ```calculationId```.
5.	Generates the final declaration tax calculation - this process will also convert any business validation warnings into errors, if there are any errors the calculation will not run and the customer will not be able to declare the liability.
6.	HMRC Stores tax calculation with ```calculationId```.
7.	The software uses the [Submit a Self Assessment Final Declaration](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individual-calculations-api/3.0#Submit%20a%20Self%20Assessment%20Final%20Declaration) to agree to the final declaration.

We suggest that you retrieve the self-assessment metadata first to check there are no validation errors.  If there are errors the calculation will not have been generated. The customer must go back and amend the digital records, software should resubmit the revised summary totals for the relevant periods, then call the Trigger A Self Assessment Tax Calculation endpoint again.

8.	HMRC provides the calculation response.
9.	Software surfaces the calculation to the customer – at this point in the journey, it is mandatory that the customer is shown a copy of the calculation resulting from the intent to final declaration ```calculationId```. As a minimum a customer must view the equivalent of what is currently in the SA302.
10.	The customer reviews the calculation and declaration text.
11.	The customer confirms the declaration and the software calls the Crystallisation endpoint using the Calculation ID to confirm the calculation to which the customer is agreeing.
12.	HMRC receives the submission and confirms receipt with a success message and marks the obligation as fulfilled.
13.	The software receives a success message and confirms that HMRC has received the return.
14.	The customer views confirmation that the return has been successfully submitted to HMRC.

The software must use the final declaration ```calculationId``` to retrieve the final calculation and display that calculation to the customer. The customer must review this calculation and confirm it is complete and correct by sending the declaration.

If the customer thinks the calculation is incorrect as a result of the data they have submitted, they can go back and change the information, by resubmitting the relevant update with the correct information. Once they have done this the software will have to call the Trigger endpoint again to generate a new final liability.

If the customer does not agree with the calculation based on rules HMRC have used, then they will still need to declare against this calculation and follow the existing process to challenge the calculation. If a software vendor identifies what they feel could be a technical issue with the Tax calculation API, they will need to contact the SDS Team immediately.

Once a customer is confident with all the information, they will have to agree to a declaration and send it to HMRC.

 > **The Declaration**

> “Before you can submit the information displayed here in response to your notice to file from HM Revenue & Customs, you must read and agree to the following statement by

> [Here the vendor can decide how to manage the actual declaration in the user interface, for example a tick box, confirm button or other method]

> I declare that the information and self-assessment I have filed are (taken together) correct and complete to the best of my knowledge. I understand that I may have to pay financial penalties and face prosecution if I give false information.”

> **Declaration for Agents**

 > "I confirm that my client has received a copy of all the information being filed and approved the information as being correct and complete to the best of their knowledge and belief. My client understands that they may have to pay financial penalties and face prosecution if they give false information."

The software must send the ```calculationId``` that matches the calculation the customer is declaring against with the declaration.

## Making an amendment after final declaration

If a customer wants to make any changes following a final declaration they have 12 months from the statutory filing date to do this (the statutory filing date is 31 January following the end of the tax year, or 3 months from receipt of a Notice to File by the taxpayer whichever is the later).

Note: any changes made following final declaration will be a formal amendment under section 9ZA TMA 1970

## Pay or get a repayment

Vendors should present messages to business users at key points in their user journey that gives them the option to make payments ahead of any obligation date to help spread the cost. We will deliver functionality that allows vendors to make users aware of payment dates.

There are multiple ways to make a payment for Self Assessment which can be found on GOV.UK at:

[https://www.gov.uk/pay-self-assessment-tax-bill](https://www.gov.uk/pay-self-assessment-tax-bill)

Vendors should, in their messaging, ask customers to visit that link so the customer can make a payment in the method that suits them.

The contents of this GOV.UK page will be updated and subject to change.

For a business to view the previous payments it has made to HMRC, vendors should present messages at key points in their journey that encourage them to visit their Business Tax Account at:

[https://www.access.service.gov.uk/login/signin/creds](https://www.access.service.gov.uk/login/signin/creds)

Vendors in their messaging should ask customers to visit that link.

Customers can pay their tax bills by direct debit, making it easy and convenient to pay.
HMRC is delivering functionality for customers to set up direct debit instructions to pay tax when it becomes due. Customers may also set up a regular payment plan to ensure funds are available when tax becomes due.
These services will be available when a customer first subscribes to HMRCs tax services, and at any time after a customer has been subscribed through their digital tax
account. Access to the services will be via the customer’s digital tax account at:

[https://www.access.service.gov.uk/login/signin/creds](https://www.access.service.gov.uk/login/signin/creds)

Vendors in their messaging should ask customers to visit that link.  

Customers will be able to view payments made to HMRC in the software. Details will be updated here once they are available.
