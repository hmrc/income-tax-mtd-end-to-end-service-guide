---
title: Payments and Liabilities | Income Tax (MTD) End-to-End Service Guide
weight: 5
---

# Payments and Liabilities
 
The Self Assessment Account API allows a developer to retrieve accounting information to be shown back to the customer. This includes listing payments the customer has made, how these payments have been allocated and details of any upcoming or outstanding liabilities. 
The data returned only relates to payments and liabilities arising for tax years since the customer joined the new service. There may also be outstanding liabilities and payment information a customer needs to view for the years prior to signing up to Making Tax Digital for Income Tax Self Assessment that can be viewed using their existing Personal Tax Account.

With these endpoints a developer can:

* retrieve the overall liability broken down into overdue, payable and pending amounts
* retrieve a list of crystallised charges and payments for a given date
range
* list self-assessment charges between two dates
* retrieve the history of changes to an individual charge
* retrieve a list of payments for a given date range
* retrieve the allocation details of a specific payment against one or more liabilities

<a href="figures/payments-and-liabilities-rsab.svg" target="blank"><img src="figures/payments-and-liabilities-rsab.svg" alt="Retrieve a Self Assessment Balance diagram" style="width:720px;" /></a>

<a href="figures/payments-and-liabilities-rsab.svg" target="blank">Open the Retrieve a Self Assessment Balance diagram in a new tab</a>.

[Retrieve a Self Assessment Balance [test only]](https://developer.qa.tax.service.gov.uk/api-documentation/docs/api/service/self-assessment-accounts-api/1.0#_retrieve-a-self-assessment-balance-test-only_get_accordion)

This endpoint allows a developer to retrieve the overall liability broken down into overdue, currently due (payable) and pending (not yet due) amounts. A unique identifier (National Insurance number) for the account must be used.

<a href="figures/payments-and-liabilities-lsat.svg" target="blank"><img src="figures/payments-and-liabilities-lsat.svg" alt="List Self Assessment Transactions diagram" style="width:720px;" /></a>

<a href="figures/payments-and-liabilities-lsat.svg" target="blank">Open the List Self Assessment Transactions diagram in a new tab</a>.
 
[List Self Assessment Transactions [test only]](https://developer.qa.tax.service.gov.uk/api-documentation/docs/api/service/self-assessment-accounts-api/1.0#_list-self-assessment-transactions-test-only_get_accordion)

This endpoint allows a developer to retrieve a list of charges and payments for a given date range. The developer must quote a unique identifier (National Insurance number) for the account and provide a search period.

<a href="figures/payments-and-liabilities-lsac.svg" target="blank"><img src="figures/payments-and-liabilities-lsac.svg" alt="List Self Assessment Charges diagram" style="width:720px;" /></a>

<a href="figures/payments-and-liabilities-lsac.svg" target="blank">Open the List Self Assessment Charges diagram in a new tab</a>.

[List Self Assessment Charges [test only]](https://developer.qa.tax.service.gov.uk/api-documentation/docs/api/service/self-assessment-accounts-api/1.0#_retrieve-a-self-assessment-transactions-detail-test-only_get_accordion)

This endpoint allows a developer to retrieve the details of charges made to an account between two dates. The developer must use a unique identifier for the account (National Insurance number) and provide a valid date range.

<a href="figures/payments-and-liabilities-rsach.svg" target="blank"><img src="figures/payments-and-liabilities-rsach.svg" alt="Retrieve a Self Assessment Charge's History diagram" style="width:720px;" /></a>

<a href="figures/payments-and-liabilities-rsach.svg" target="blank">Open the Retrieve a Self Assessment Charge's History diagram in a new tab</a>.

[Retrieve a Self Assessment Charge's History [test only]](https://developer.qa.tax.service.gov.uk/api-documentation/docs/api/service/self-assessment-accounts-api/1.0#_retrieve-a-self-assessment-charges-history-test-only_get_accordion) 

This endpoint allows a developer to retrieve the history of changes to an individual charge. The user must quote a unique identifier (National Insurance number) for the account and also the charge identifier.

<a href="figures/payments-and-liabilities-rsap.svg" target="blank"><img src="figures/payments-and-liabilities-rsap.svg" alt="List Self Assessment Payments diagram" style="width:720px;" /></a>

<a href="figures/payments-and-liabilities-rsap.svg" target="blank">Open the List Self Assessment Payments diagram in a new tab</a>.

[List Self Assessment Payments [test only]](https://developer.qa.tax.service.gov.uk/api-documentation/docs/api/service/self-assessment-accounts-api/1.0#_list-self-assessment-payments-test-only_get_accordion)

This endpoint allows a developer to retrieve a list of payments for a given date range. The developer must use a unique identifier for the account (National Insurance number) and provide a date range.

<a href="figures/payments-and-liabilities-rsapad.svg" target="blank"><img src="figures/payments-and-liabilities-rsapad.svg" alt="Retrieve a Self Assessment Payment's Allocation Details diagram" style="width:720px;" /></a>

<a href="figures/payments-and-liabilities-rsapad.svg" target="blank">Open the Retrieve a Self Assessment Payment's Allocation Details diagram in a new tab</a>.

[Retrieve a Self Assessment Payment's Allocation Details [test only]](https://developer.qa.tax.service.gov.uk/api-documentation/docs/api/service/self-assessment-accounts-api/1.0#_retrieve-a-self-assessment-payments-allocation-details-test-only_get_accordion)

This endpoint allows a developer to retrieve the allocation details of a specific payment against one or more liabilities. The unique identifier must be used for both the account (National Insurance number) and the payment (Payment Reference).

## Coding Out Underpayments and Debt

Coding out is a concept used to collect underpaid tax and debts through a customer’s PAYE tax code.

The coding out underpayments and debts endpoints allow software packages to overwrite coding out underpayment and debt amounts that are held by HMRC for a previous tax year and given NINO.

Software packages can then amend previously submitted overwrite amounts, retrieve the HMRC held or user submitted coding out amounts or delete the user submitted amounts.

Use these endpoints to create, amend, retrieve or delete a coding out amount:

[Retrieve Coding Out underpayments and debt amounts [test only]](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-accounts-api/1.0#_retrieve-Coding-Out-underpayments-and-debt-amounts-test-only_get_accordion)

[Create or Amend Coding Out underpayment and debt amounts [test only]](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-accounts-api/1.0#_Create-or-Amend-Coding-Out-underpayment-and-debt-amounts-test-only_put_accordion)

[Delete Coding Out underpayments and debt amounts [test only]](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-accounts-api/1.0#_Delete-Coding-Out-underpayments-and-debt-amounts-test-only_delete_accordion)