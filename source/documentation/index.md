# Income Tax (Making Tax Digital) end-to-end service guide

**Version 4.4** issued June 2024 (see [changelog](#document-changelog))

This service guide explains how you can integrate your software with the [Income Tax (Making Tax Digital) APIs](/api-documentation/docs/api?filter=income-tax-mtd). 

>|Help us improve this guide |
|---|
|This guide is currently being revised and overhauled to ensure it meets the needs of software providers. See the service guide [changelog](#document-changelog) for latest updates.<br/><br/>If there is a way that this guide could be improved or expanded to meet your needs, <b>now is the time to let us know.</b><br/><br/>If you use this guide regularly, we&#39;d like to invite you to share your thoughts and feedback via an online video call, which will involve a 60-minute one-to-one interview.<br/><br/>We’d like to explore:<ul><li>Your current use of and experience with the service guide</li><li>Any challenges you face</li><li>How helpful you find the service guide</li><li>Your thoughts on the current service guide, how it fits your needs and how it can be improved</li></ul><br/>If you would like to help us improve this guide, email [mtdapi-ur-g@digital.hmrc.gov.uk](mailto:mtdapi-ur-g@digital.hmrc.gov.uk) to arrange an interview.|

## Overview

This guidance explains how you can integrate your software with our APIs. It provides examples of how they fit into various end-to-end user journeys to enable individuals and their agents, where authorised, to meet their obligations after they have signed up to Making Tax Digital. Under Making Tax Digital, making your final declaration is the last step of reporting your income to HMRC and filing your Self Assessment tax return.

For more information about eligibility, sign-up and how customers will use Making Tax Digital for Income Tax, refer to [Making Tax Digital for Income Tax step by step guidance (GOV.UK)](https://www.gov.uk/guidance/use-making-tax-digital-for-income-tax).

HMRC's vision for Making Tax Digital (MTD) for Income Tax is to allow individuals to fulfil their income tax obligations entirely through compatible software whilst still being fully responsible for the data that is submitted. Customers will be able to:

- maintain a digital record of their tax affairs
- submit quarterly updates of income and expenditure
- make any tax allowances and adjustments
- claim for losses
- make any accounting adjustments as needed
- receive nudges and prompts from HMRC
- submit any other income sources
- make a final declaration to submit a tax return 

HMRC will provide APIs to support submission of all personal data items under Self Assessment as set out above, that is, all the things individuals need to do to comply with their Income Tax obligations. This will create market demand for third-party software that enables users to finalise the entirety of their tax affairs.

## Compatible software

Compatible software can mean either a single end-to-end piece of software or a set of compatible software products. To gain Production credentials for, and access to, Making Tax Digital for Income Tax APIs, software needs to meet the [minimum functionality standards](/guides/income-tax-mtd-end-to-end-service-guide/documentation/how-to-integrate.html#minimum-functionality-standards).

HMRC recognises that an all-in-one product will not be right for everyone, and some customers or agents may wish to use combinations of different pieces of software. For example, combining dedicated record keeping software with dedicated tax filing software. When a customer uses a combination of products, after they have entered a digital record into a compatible software product, they must be able to follow the rules for digital links set out by HMRC in the Software Notice.

## Bridging software

Some customers may wish to integrate their existing software solution for record keeping with Making Tax Digital for Income Tax APIs by using another product that can submit quarterly updates, make a final declaration and view tax liabilities. We refer to these products as 'bridging products'. 

Customers who choose to use bridging software must digitally link it to their record-keeping software. This will ensure that customers meet their Making Tax Digital for Income Tax obligations when they use more than one compatible software product, which collectively meet the [minimum functionality standards](/guides/income-tax-mtd-end-to-end-service-guide/documentation/how-to-integrate.html#minimum-functionality-standards) set out in this guide.

For more information about digitally linking to software, refer to[ Use Making Tax Digital for Income Tax (GOV.UK)](https://www.gov.uk/guidance/use-making-tax-digital-for-income-tax/keep-digital-records).

## Free-to-use software

The UK government is committed to ensuring the availability of free software products for small businesses with simple tax affairs that are mandated to use Making Tax Digital for Income Tax. HMRC strongly encourages all software providers to produce a free version of their software.

In addition to meeting the [minimum functionality standards](/guides/income-tax-mtd-end-to-end-service-guide/documentation/how-to-integrate.html#minimum-functionality-standards) set out in this guide, we expect any free software product you provide to businesses with the simplest tax affairs to:

- have a reasonable level of guidance
- have help and support to users
- be free for the business to use to comply with their Making Tax Digital for Income Tax obligations for a full annual accounting period

There is no expectation that a free product will include VAT, Corporation Tax or PAYE functionality. HMRC would not require free software to link or integrate with an agent product. However, free software could be used in conjunction with wider compatible software products, if necessary.

## Mapping APIs to Self Assessment tax return forms

Parameters in some Income Tax (Making Tax Digital) APIs map to box numbers in [Self Assessment tax return forms (GOV.UK)](https://www.gov.uk/self-assessment-tax-return-forms). You can download this mapping information as CSV files from [income-tax-mtd-changelog/mapping](https://github.com/hmrc/income-tax-mtd-changelog/blob/main/mapping/mapping-csv-files.md) (GitHub).

## Navigating Income Tax (Making Tax Digital) API documentation

The following table lists the documents for Income Tax (Making Tax Digital) APIs and outlines the content and intended readers of each document.

| Document | Content type | Summary | Intended readers |
| -------- | ------------ | ------- | ---------------- |
| [Income Tax (Making Tax Digital) roadmap](/roadmaps/mtd-itsa-vendors-roadmap/#making-tax-digital-itsa-roadmap) | Functional | Learn about upcoming functional changes to Income Tax (Making Tax Digital) APIs and their scheduled release timelines. | Product managers<br /><br />Business analysts |
| Income Tax (Making Tax Digital) end-to-end service guide (this document) | Functional | Learn how you can integrate your application software with Income Tax (Making Tax Digital) APIs. | Product managers<br /><br />Business analysts<br /><br />Software developers |
| [Income Tax (Making Tax Digital) API landing pages](/api-documentation/docs/api?filter=income-tax-mtd) <br /><br />Example: [Business Details API](/api-documentation/docs/api/service/business-details-api/) | Functional | Learn about the high-level functionality of each API. | Product managers<br /><br />Business analysts<br /><br />Software developers |
| Income Tax (Making Tax Digital) API reference pages (accessible from API landing pages)<br /><br />Example: [Business Details API v1.0](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/business-details-api/1.0/oas/page) | Technical | Learn in detail about the request and response schemas, test data and error handling of each API. | Business analysts<br /><br />Software developers |

## Changelogs

### API changelog

The [API changelog](https://github.com/hmrc/income-tax-mtd-changelog) (GitHub) provides detailed and comprehensive information about API changes.

### Document changelog

Below is a summary of updates to this service guide.

#### Version 4.4

11 June 2024

- Add section Navigating Income Tax (Making Tax Digital) API documentation

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
