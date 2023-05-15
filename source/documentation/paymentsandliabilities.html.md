---
title: Payments and Liabilities | Income Tax (MTD) End-to-End Service Guide
weight: 5
description: Software developers, designers, product owners or business analysts. Integrate your software with the Income Tax API for Making Tax Digital.
---

<!--- Section owner: MTD Programme --->

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

<a href="figures/payments-and-liabilities-rsab.svg" target="blank"><img src="figures/payments-and-liabilities-rsab.svg" alt="Retrieve a Self Assessment Balance Transactions diagram" style="width:720px;" /></a>

<a href="figures/payments-and-liabilities-rsab.svg" target="blank">Open the Retrieve a Self Assessment Balance and Transactions diagram in a new tab</a>.

[Retrieve Self Assessment Balance and Transactions](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-accounts-api/2.0/oas/page#tag/Payments-and-Liabilities/paths/~1accounts~1self-assessment~1%7Bnino%7D~1balance-and-transactions/get)

This endpoint enables you to retrieve the overall liability broken down into overdue, currently due (payable) and pending (not yet due) amounts. A unique identifier (National Insurance number) for the account must be used.

<a href="figures/payments-and-liabilities-lsat.svg" target="blank"><img src="figures/payments-and-liabilities-lsat.svg" alt="List Self Assessment Transactions diagram" style="width:720px;" /></a>

<a href="figures/payments-and-liabilities-lsat.svg" target="blank">Open the List Self Assessment Payments and Allocation Details diagram in a new tab</a>.

[List Self Assessment Payments and Allocation Details](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-accounts-api/2.0/oas/page#tag/Payments-and-Liabilities/paths/~1accounts~1self-assessment~1%7Bnino%7D~1payments-and-allocations/get)

This endpoint enables you to list the payments and allocation details of one or more liabilities for a given National Insurance number.

<a href="figures/payments-and-liabilities-rsach.svg" target="blank"><img src="figures/payments-and-liabilities-rsach.svg" alt="Retrieve a Self Assessment Charge's History diagram" style="width:720px;" /></a>

<a href="figures/payments-and-liabilities-rsach.svg" target="blank">Open the Retrieve a Self Assessment Charge's History diagram in a new tab</a>.

[Retrieve History of a Self-Assessment Charge](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-accounts-api/2.0/oas/page#tag/Payments-and-Liabilities/paths/~1accounts~1self-assessment~1%7Bnino%7D~1charges~1%7BtransactionId%7D/get)

This endpoint enables you to retrieve the history of changes to an individual charge. The user must quote a unique identifier (National Insurance number) for the account and also a transaction ID.
