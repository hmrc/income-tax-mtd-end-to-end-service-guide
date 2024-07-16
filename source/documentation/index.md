# Income Tax (Making Tax Digital) end-to-end service guide

Updated 16 July 2024 (see [changelog](#document-changelog))


This service guide explains how you can integrate your software with the [Income Tax (Making Tax Digital) APIs](/api-documentation/docs/api?filter=income-tax-mtd). 

> **Help us improve this guide**: [leave your feedback here](https://docs.google.com/forms/d/e/1FAIpQLSe9jb0WCXWO9yt6zLBTKZLSK2oiTQcGPD96CTiwnQF0QxH5Tw/viewform).

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

#### 16 July 2024

- Update annual turnover threshold for submitting consolidated expenses in [Submit quarterly update](/guides/income-tax-mtd-end-to-end-service-guide/documentation/make-updates-during-tax-year.html#submit-quarterly-update) (from £85,000 to £90,000)
- Update response time details and GOV.UK link in [Supporting customers in MTD](/guides/income-tax-mtd-end-to-end-service-guide/documentation/how-to-integrate.html#supporting-customers-in-mtd)
- Remove mentions of end-of-period statements (EOPS)

#### 5 July 2024

- Add [MTD terminology (style guide)](/guides/income-tax-mtd-end-to-end-service-guide/documentation/mtd-terminology.html) section
- Update [API status](/guides/income-tax-mtd-end-to-end-service-guide/documentation/how-to-integrate.html#api-status) table with note about fully deprecated APIs

#### 20 June 2024

- Revise Overview and Software provider sections
- Revise Minimum functionality standards section
- Revise Getting Production Approval section
- Retitle Stateful and dynamic testing section to 'Sandbox testing'
- Update HMRC Assist section

#### 11 June 2024

- Add section Navigating Income Tax (Making Tax Digital) API documentation

#### 28 May 2024

- Update API endpoint links within this document to point to latest available versions
- Update Penalties and appeals section with latest information about Penalty Reform for ITSA
- Update HMRC Assist section introduction

#### 30 April 2024

- Implement revised document structure (no content has been removed)

#### 23 April 2024

- Update user research contact email address

#### 16 April 2024

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

#### 18 March 2024

- Update Business and property income section:
  - add new section Change to calendar quarters
  - add new content to section Submit quarterly update
- Update Final declaration section:
  - remove all references to 'crystallisation'
  - remove sections Calculations that produce errors and Calculations that are free from errors, which are now in section Tax calculations
  - change 'calcuationId' to 'Calculation ID' and 'finalDeclaraton' to 'Final Declaration'
  - update tax account links in section Pay or get a repayment
- Update HMRC online services section:
  - update status of 'Elect for calendar quarterly periods' task
  - add new table column that explains choice of service (HMRC online services or software or both) used to make each functionality available
- Update Using tax codes to collect tax due section (formerly Coding Out):
  - retitle section
  - rewrite section
  - add content about opting out

#### 31 January 2024

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

#### 24 January 2024

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

#### 13 December 2023

* Update Additional information / Employments section with off-payroll working details
* Update Customer support mode section
* Update Using tax codes to collect tax due section (formerly Coding Out)
* Update UR contact email address

#### 15 November 2023

* Update content and diagram in Payments and liabilities section
* Remove crystallisation endpoint content from Final declaration section

#### 2 November 2023

* Add new Customer status section describing business purpose of the new Self Assessment Individual Details API
* Update Construction Industry Scheme section and move it into Business and Property Income section
* Update Software choices section
* Update APIs in Minimum functionality standards section
* Remove duplicate Finalise business income End of Period Statement (EOPS) section

#### 4 October 2023

* Update content for HMRC online services section
* Update content for Opting out of MTD section
* Update content for HMRC Assist section

#### 20 September 2023

* Update content for Penalties and appeals section
* Update content for Final declaration section
* Update content for Production approvals process section
* Update content for Software choices section
* Update content for Bridging software section
* Remove Business Validation Rules section

#### 27 June 2023

* Add API lifecycle & deprecation section, remove some duplicated content

#### 14 June 2023

* Update API and endpoint links