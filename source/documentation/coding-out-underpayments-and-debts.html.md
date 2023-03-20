---
title: Coding Out Underpayments and Debts | Income Tax (MTD) End-to-End Service Guide
weight: 33
description: Software developers, designers, product owners or business analysts. Integrate your software with the Income Tax API for Making Tax Digital.
---

<!--- Section owner: MTD Programme --->

# Coding Out

Where a Self Assessment customer has PAYE income in addition to business income, HMRC will try to collect any tax due on their final declaration via their tax code for the following tax year. There are some restrictions around this - see [Pay your Self Assessment tax bill: Through your tax code](https://www.gov.uk/pay-self-assessment-tax-bill/through-your-tax-code).

Where a customer does not want us to collect the underpayment via the tax code, they have to request this via [Self Assessment Accounts (MTD)](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-accounts-api/2.0#coding-out-underpayments-and-debts). This can be also be done via the ITSA submission service.


## Collecting MTD debts through the tax code

 In future, where an MTD customer with PAYE income in addition to business income has overdue tax charges, HMRC will try to collect this debt via their PAYE tax code.
