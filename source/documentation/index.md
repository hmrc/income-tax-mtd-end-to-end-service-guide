# Income Tax (Making Tax Digital) end-to-end service guide

**Version 4.3** issued May 2024 (see [changelog](#document-changelog))

This service guide explains how you can integrate your software with the [Income Tax (Making Tax Digital) APIs](/api-documentation/docs/api?filter=income-tax-mtd). 

>|Help us improve this guide |
|---|
|This guide is currently being revised and overhauled to ensure it meets the needs of software providers. See the service guide [changelog](#document-changelog) for latest updates.<br/><br/>If there is a way that this guide could be improved or expanded to meet your needs, <b>now is the time to let us know.</b><br/><br/>If you use this guide regularly, we&#39;d like to invite you to share your thoughts and feedback via an online video call, which will involve a 60-minute one-to-one interview.<br/><br/>We’d like to explore:<ul><li>Your current use of and experience with the service guide</li><li>Any challenges you face</li><li>How helpful you find the service guide</li><li>Your thoughts on the current service guide, how it fits your needs and how it can be improved</li></ul><br/>If you would like to help us improve this guide, email [mtdapi-ur-g@digital.hmrc.gov.uk](mailto:mtdapi-ur-g@digital.hmrc.gov.uk) to arrange an interview.|

## Overview

This guide explains how you can integrate your software with our APIs, and provides examples of how they fit into various end-to-end user journeys to enable agents and individuals to meet their obligations after they have signed up to Making Tax Digital, a service where quarterly updates and final declarations will replace the need for a Self Assessment return to be submitted.

For more information about eligibility and how to use Making Tax Digital for Income Tax, refer to [Making Tax Digital step by step guidance (GOV.UK)](https://www.gov.uk/government/collections/making-tax-digital-for-income-tax-for-businesses-step-by-step).

## Software provider overview

HMRC expects software providers to offer customers a streamlined end-to-end journey, and as far as possible, to support all the things the customers need to do to comply with their MTD for ITSA obligations. This will include the ability to finalise the overall tax position using software.

HMRC will provide the APIs for the software to support all of the personal data items that need to be submitted under Self Assessment. Although these elements will not be mandated through the software, there will be market demand for software that enables any user to finalise the entirety of their tax affairs.

By developing a product now, you will support the mandate of the service, influence its design and ensure you have a product ready for the millions of customers that will need MTD-compatible software.

### Bridging software

Some customers may wish to integrate their existing software solution for digital record keeping with another product that can submit quarterly updates, End of Period Statement, view tax liabilities, make a self assessment and final declaration, and so on. We generally refer to these products as bridging products.

To be granted production credentials for a bridging product, it must be digitally linked to software that allows customers to maintain business records required by law.

### Non-MTD products

Software providers who wish to selectively use Making Tax Digital for Income Tax APIs and not build a Making Tax Digital product will have to submit a business case, justifying use of a particular or multiple API’s. Such products may be granted production credentials at the discretion of HMRC.

<!-- ## How to use this guide -->

## Mapping APIs to Self Assessment tax return forms

Parameters in some Income Tax (Making Tax Digital) APIs map to box numbers in [Self Assessment tax return forms (GOV.UK)](https://www.gov.uk/self-assessment-tax-return-forms). You can download this mapping information as CSV files from [income-tax-mtd-changelog/mapping](https://github.com/hmrc/income-tax-mtd-changelog/blob/main/mapping/mapping-csv-files.md) (GitHub).

## Changelogs

### API changelog

The [API changelog](https://github.com/hmrc/income-tax-mtd-changelog) (GitHub) provides detailed and comprehensive information about API changes.

### Document changelog

Below is a summary of updates to this service guide.

#### Version 4.3

28 May 2024

- Update API endpoint links within this document to point to latest available versions
- Update Penalties and appeals section with latest information about Penalty Reform for ITSA
- Update HMRC Assist section introduction

#### Version 4.2

30 April 2024

- Implement revised document structure (no content has been removed)

#### Version 4.1

23 April 2024

- Update user research contact email address

#### Version 4.0

16 April 2024

- Add section Stateful and dynamic testing, which includes an example user journey to:
  - make a Self-Employment or Property Business submission
  - request a Business Source Adjustable Summary
- Add section Mapping APIs to Self Assessment tax return forms
- Update Business and property income section:
  - remove sentence from section Submit quarterly update about error if £85,000 limit is exceeded
  - remove flow chart from section Submit accounting adjustments
- Update Additional information section:
  - update section introduction with new content about breakup of Individuals Income Received API
  - update API endpoint links to point to new APIs that replace Individuals Income Received API

#### Version 3.9

18 March 2024

- Update Business and property income section:
  - add new section Change to calendar quarters
  - add new content to section Submit quarterly update
- Update Final declaration section:
  - remove all references to ‘crystallisation’
  - remove sections Calculations that produce errors and Calculations that are free from errors, which are now in section Tax calculations
  - change ’calcuationId' to 'Calculation ID' and 'finalDeclaraton' to 'Final Declaration'
  - update tax account links in section Pay or get a repayment
- Update HMRC online services section:
  - update status of ‘Elect for calendar quarterly periods’ task
  - add new table column that explains choice of service (HMRC online services or software or both) used to make each functionality available
- Update Using tax codes to collect tax due section (formerly Coding Out):
  - retitle section
  - rewrite section
  - add content about opting out

#### Version 3.8

31 January 2024

- Update Deprecating APIs section with details about new deprecation headers
- Update the following section of Business and property income section:

  - Tax calculations (formerly Retrieve a tax calculation)

- Update the following sections of Additional information section (formerly Additional Income):

  - New section introduction for Additional Information (remove Submit information about personal income)
  - Employments (move some content to new section Employment Expenses)
  - Dividends Income
  - Pensions Income
  - Other Income
  - Savings Income
  - Savings Accounts
  - Disclosures
  - Individual Charges (formerly Pension Charges)
  - Individual Reliefs
  - Other Deductions
  - Employment Expenses (formerly Individual Expenses Other)
  - Non-PAYE Income
  - State Benefits
  - Providing information about how to treat a loss

#### Version 3.7

24 January 2024

- Update the following sections of Business and property income section:

  - Retrieving obligations
  - Submit quarterly updates for self-employment and property businesses
  - Submit annual updates for self-employment and property businesses
  - Submit accounting adjustments
  - Construction Industry Scheme
  - Finalise business income End of Period Statement (EOPS)
  - Tax calculations (formerly 'Retrieve a tax calculation')

- Move the content of the following sections to other sections in Business and Property Income section:

  -  Business Income Source Summary
  -  View previously submitted updates
  -  Making changes to previously submitted data
  -  Multiple businesses

- Update the HMRC online services section as follows:

  - update status of 2 tasks
  - move Opting out of MTD section into HMRC online services section

- Update the following sections of Additional information section:

  - Foreign Income
  - Insurance Policies Income
  - Capital Gains Tax
  - Marriage Allowance

#### Version 3.6

13 December 2023

* Update Additional information / Employments section with off-payroll working details
* Update Customer support mode section
* Update Using tax codes to collect tax due section (formerly Coding Out)
* Update UR contact email address

#### Version 3.5

15 November 2023

* Update content and diagram in Payments and liabilities section
* Remove crystallisation endpoint content from Final declaration section

#### Version 3.4

2 November 2023

* Add new Customer status section describing business purpose of the new Self Assessment Individual Details API
* Update Construction Industry Scheme section and move it into Business and Property Income section
* Update Software choices section
* Update APIs in Minimum functionality standards section
* Remove duplicate Finalise business income End of Period Statement (EOPS) section

#### Version 3.3

4 October 2023

* Update content for HMRC online services section
* Update content for Opting out of MTD section
* Update content for HMRC Assist section

#### Version 3.2

20 September 2023

* Update content for Penalties and appeals section
* Update content for Final declaration section
* Update content for Production approvals process section
* Update content for Software choices section
* Update content for Bridging software section
* Remove Business Validation Rules section

#### Version 3.1

27 June 2023

* Add API lifecycle & deprecation section, remove some duplicated content

#### Version 3.0

14 June 2023

* Update API and endpoint links

#### Version 2.9

* Update direct links to endpoints to reflect changes in how API documentation is published

#### Version 2.8

* Update HMRC Assist section

#### Version 2.7

* Update guide to reflect simplified v3.0 final declaration process and update section on customers opting out of MTD

#### Version 2.6

* Update guide to reflect API changes, including refactored Self Assessment Accounts API

#### Version 2.5

* Update guide to reflect new API versions, update links and correct and clarify some content

#### Version 2.4

* Update Frequently Asked Questions section to remove some items

#### Version 2.3

* Add note and an example table demonstrating how adjustments submitted work

#### Version 2.2

* Add a Frequently Asked Questions section to the menu tree

#### Version 2.1

* Notice of version change to Business Income Source Summary V1.0
* Replace 'Set up' heading with 'Sign up' with and update menu tree to have only three sections: **Agent**, **Individual** and **Link software to HMRC**
* Update content in the **Minimum functionality standards** section and add two other sections: **Bridging software** and **Non-MTD products**
* Update content in the **Declaration** and **Declaration for agents** sections of **Final declaration** (previously called 'crystallisation')

#### Version 2.0

* Add Capital Gains Tax, Marriage Allowance, Non-PAYE Income, Coding out underpayments and debts

#### Version 1.9

* Add requirement for businesses and landlords to provide information about residential property disposals
* Add information regarding BSAS adjustments
* Add content changes to meet MTD Style Guide V2.2
* Replace the term ‘crystallisation’ with ‘final declaration'

#### Version 1.8

* Add deprecation dates for Self Assessment API Endpoints
* Notice of version change to Business Source Adjustable Summary (MTD) - V 1.0
* Notice of version change to Individual Losses (MTD) - V1.0
* Notice of version change to Individual Calculations v 1.0

#### Version 1.7

* Change title to Income Tax (Making Tax Digital) end-to-end Service Guide
* Include Income Tax (MTD) APIs
* Include Tax Terminology
* Add Foreign Property reference to Obligations
* Replace the term 'taxpayers' with 'customers'
* Replace references to SA Accounting Summary API with BSAS API

#### Version 1.6

* Revise wording for Draft MTD ITSA Regulations 2021 page

#### Version 1.5

* Add Production approvals process for Making Tax Digital for Self Assessment
* Add early draft MTD ITSA Regulations 2021 section

#### Version 1.4

* Update Construction Industry Scheme (CIS) section

#### Version 1.3

* Update Losses
* Add Additional information section

#### Version 1.2

* Add Multiple businesses section
* Add Construction Industry Scheme (CIS) section

#### Version 1.1

* Add Payments and liabilities section
