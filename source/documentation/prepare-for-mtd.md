# Customers and agents preparing for MTD

## Who can sign up and how

Sign-up by means of an API has been ruled out for security reasons.

Taxpayers can sign up for Making Tax Digital for Income Tax without having software in place. However, they must get and authorise [software](/guides/income-tax-mtd-end-to-end-service-guide/documentation/how-to-integrate.html#software-choices) before they start using Making Tax Digital for Income Tax.

To use Making Tax Digital for Income Tax, individuals need to sign up first.

To sign up, a user must:

- be a sole trader (self-employed) and/or
- have income from property, either in the UK or abroad

See [Sign up as an individual for Making Tax Digital for Income Tax (GOV.UK)](https://www.gov.uk/guidance/sign-up-your-business-for-making-tax-digital-for-income-tax) for more information.

If an individual is a self employed partner in a partnership, they do not need to sign up to MTD ITSA unless they have other MTD qualifying income, such as:

- sole trader income
- UK or foreign property income

If this is the case, the individual must not include either their partner or partnership business details in the sign-up service. Instead, this income will continue to be submitted as part of their self assessment tax return.  There is no requirement at this time to submit partner or partnership income quarterly to HMRC.

A user can also get their appointed tax agent (for instance, an accountant or bookkeeper) to sign up on their behalf, with their permission.

We advise customers to speak to their agent (if they have one) before choosing software to ensure that it is compatible.

### Agent sign-up

Before agents can sign up clients to Making Tax Digital, they must:

- [create an agent services account (GOV.UK)](https://www.gov.uk/guidance/get-an-hmrc-agent-services-account)
- use their [agent services account (GOV.UK)](https://www.gov.uk/guidance/sign-in-to-your-agent-services-account) to have authorisation in place from their clients:
  - existing clients - copy existing authorisations from Self Assessment
  - new clients - request authorisation

For more information, refer to [Making Tax Digital for Income Tax as an agent: step by step (GOV.UK)](https://www.gov.uk/government/collections/making-tax-digital-for-income-tax-as-an-agent-step-by-step).

### Individual sign-up

Individuals who are self employed and/or have property income can sign themselves up for Making Tax Digital for Income Tax.

For more information, refer to [Making Tax Digital for Income Tax for individuals: step by steps (GOV.UK)](https://www.gov.uk/government/collections/making-tax-digital-for-income-tax-for-businesses-step-by-step).

## How users authorise your software

Businesses and agents using your software to connect to the [Income Tax (Making Tax Digital) APIs](/api-documentation/docs/api?filter=income-tax-mtd) must grant authority to your software to interact with HMRC on their behalf. We use the open standard [OAuth 2.0](https://oauth.net/2/), which involves the business or agent signing in using their Government Gateway account and following the grant authority user journey.

<a href="figures/link-software-to-hmrc.svg" target="blank"><img src="figures/link-software-to-hmrc.svg" alt="Link software to HMRC" style="width:720px;" /></a>

[Open the link software to HMRC process diagram in a new tab.](/guides/vat-mtd-end-to-end-service-guide/documentation/figures/link-software-to-hmrc.svg)

1.	Business or agent requests to link your software to HMRC.
2.	Your software launches the grant authority user journey.
3.	Business or agent views the HMRC start page for an overview of the process and chooses to continue.
4.	Business or agent signs in with their Government Gateway user ID and password (**agents must use their new agent services user ID**).
5.	Business or agent registers for or completes 2-step verification as applicable.
6.	Business or agent completes identity checks if applicable.
7.	Business or agent grants authority for the software to interact with HMRC on their behalf.
8.	HMRC generates an OAuth token for the business or agent.
9.	Your software stores the business or agent’s OAuth token for later use in API calls on their behalf.

Businesses and agents authenticate directly with us using their Government Gateway user ID and password, and grant the software the authority to interact with HMRC on their behalf. They grant this for a set of functions called API scopes which are required for each ITSA (MTD) endpoint.

In the case of agents, they must sign in to their Government Gateway account with the user ID and password for their new agent services account, which was generated as part of the agent services account journey.

We then generate an OAuth 2.0 access token for the software which is specific to the business or agent. The software must pass this access token in subsequent API requests as explained in authorisation of user-restricted endpoints.

## MTD customer status

To manage a customer's filing obligations, MTD needs to identify different types of customer in the service. To do this, MTD has allocated a status for each customer for each tax year. This status will be reviewed annually by HMRC using the latest tax return received from the customer. This status will persist year-on-year. 

In software, the customer status can be retrieved using the [Self Assessment Individual Details](/api-documentation/docs/api/service/self-assessment-individual-details-api/) API. However, the software should not show the ITSA status to the customer. Instead, the statuses can be used in software in the following ways: 

- encourage customers to fulfil their obligations 
- where necessary, inform customers that they may receive a penalty if they do not submit their updates on time
- establish if a customer can opt out of MTD or sign up and direct them to [HMRC online services](/guides/income-tax-mtd-end-to-end-service-guide/documentation/tasks-outside-mtd-software.html#hmrc-online-services) 

The different types of customer status are described below.

### MTD Mandated

MTD mandated customers have qualifying income above the MTD threshold. This status will not be set until the first mandated year when their obligations become penalty-bearing. These obligations include quarterly updates, end-of-period statement, and final declaration. 

### MTD Voluntary

MTD voluntary customers have qualifying income below or equal to the MTD threshold. These customers will have the same obligations as MTD mandated customers but only the final declaration is penalty-bearing. 

### Annual

Annual customers have an annual self-assessment return obligation which is penalty-bearing. This status will include customers who have qualifying income below or equal to the MTD threshold and have chosen not to voluntarily sign up for MTD. 

### MTD Exempt

MTD exempt customers have manually applied for an exemption from MTD. If a request has been made for VAT, it is applied to MTD ITSA without the need for a further application. These customers will have an annual self-assessment return obligation which is penalty-bearing.  

### Non-Digital

Non-digital customers have manually applied for a non-digital status. If a request has been made for VAT, it is applied to MTD ITSA without the need for a further application.  These customers will have an annual self-assessment return obligation which is penalty-bearing. Customers with this status are unlikely to be using a software product to meet their self-assessment obligations. 

### Dormant

Dormant customers are no longer required to file a self-assessment tax return. No obligations will be created. Customers with this status may start using software and intend to file a self-assessment tax return but have yet to inform HMRC.
