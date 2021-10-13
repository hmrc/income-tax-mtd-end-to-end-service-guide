---
title: Set up
weight: 3
description: Software developers, designers, product owners or business analysts. Integrate your software with the Income Tax API for Making Tax Digital.
---

# Set up

## Agent journey overview

Before agents can represent clients they must set up their software and relationships with clients.

<a href="figures/agent-journey-overview.svg" target="blank"><img src="figures/agent-journey-overview.svg" alt="Link software to HMRC" style="width:720px;" /></a>

[Open the agent set up process diagram in a new tab.](https://developer.service.hmrc.gov.uk/guides/vat-mtd-end-to-end-service-guide/documentation/figures/agent-journey-overview.svg)

1. Agent reads guidance.
2. Agent creates an agent services account and copies across existing Self Assessment clients.
3. Agent is authorised by a new Self Assessment client who has signed up to Making Tax Digital for Income Tax (in the future, we will simplify this process and introduce functionality that allows authorisation without a client having to sign up).
4. Agent registers a client for Self Assessment.
5. Agent signs up existing clients for Making Tax Digital for Income Tax.
6. Agent chooses software.
7. Agent links software to HMRC.

## Agent signs up clients for Making Tax Digital for Income Tax

Before signing up clients to Making Tax Digital for Income Tax, agents must first create a relationship by copying clients across to their agent services account.
Once an agent has copied all clients across to their agent services account, they can sign them up.

## The process for agents signing up their clients

1. Agree to terms of participation.
2. Income source check.
3. Sign into HMRC using Agent Government Gateway user ID and password (this is a one-off process).
4. Enter client's name, National Insurance number and date of birth (might not get this page if enrolment recognised).
5. Select client's income type (sole trader, rent out property or both).
6. Choose which year to sign-up for (current year or next year).
7. Select how client records income and expenses.
8. Confirm and submit information.
9. Confirmation that the business can now start submitting income tax updates, declarations and returns using compatible software.

The agent can now use software to submit Income Tax updates for their client.

Agents can complete the sign-up process without having to wait for their clients to verify their own email address.

## Business signs up for Making Tax Digital for Income Tax

Business owners can sign up for Making Tax Digital for Income Tax either directly or through an agent. They must complete the sign-up process completely before using the service. They need to sign up before first use, even if they have already signed up for Making Tax Digital for Income Tax.


## The process for Business and Landlords signing up

1. Agree to terms of participation.
2. Income source check.
3. Sign into HMRC online services using Government Gateway user ID and password.
4. Enter name, National Insurance number and date of birth (might not get this page if enrolment recognised).
5. Choose the preferred way of being contacted (though must agree to 'go paperless').
6. Select whether self-employed, rent out of property or both.
7. Choose which year to sign-up for (current year or next year).
8. Select how they record their income and expenses.
9. Confirm and submit information.
10. Receive confirmation that the business can now start submitting Income Tax updates, declarations and returns using compatible software.

## Link software to HMRC

Businesses and agents using your software to connect to the [ITSA (MTD) API](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-api/2.0) must grant authority to your software to interact with HMRC on their behalf. We use the open standard [OAuth 2.0](https://oauth.net/2/) (opens in a new tab), which involves the business or agent signing in via their Government Gateway account and following the grant authority user journey.
 
<a href="figures/link-software-to-hmrc.svg" target="blank"><img src="figures/link-software-to-hmrc.svg" alt="Link software to HMRC" style="width:720px;" /></a>

[Open the link software to HMRC process diagram in a new tab.](https://developer.service.hmrc.gov.uk/guides/vat-mtd-end-to-end-service-guide/documentation/figures/link-software-to-hmrc.svg)

1.	Business or agent requests to link your software to HMRC.
2.	Your software launches the grant authority user journey.
3.	Business or agent views the HMRC start page for an overview of the process and chooses to continue.
4.	Business or agent signs in with their Government Gateway user ID and password (**agents must use their new agent services user ID**).
5.	Business or agent registers for or completes 2-step verification as applicable.
6.	Business or agent completes identity checks if applicable.
7.	Business or agent grants authority for the software to interact with HMRC on their behalf.
8.	HMRC generates an OAuth token for the business or agent.
9.	Your software stores the business or agent’s OAuth token for later use in API calls on their behalf.

Business and agents authenticate directly with us using their Government Gateway user ID and password, and grant the software the authority to interact with HMRC on their behalf. They grant this for a set of functions called API scopes which are required for each ITSA (MTD) endpoint.

In the case of agents, they must sign in to their Government Gateway account with the user ID and password for their new agent services account, which was generated as part of the agent services account journey.

We then generate an OAuth 2.0 access token for the software which is specific to the business or agent. The software must pass this access token in subsequent API requests as explained in authorisation of user-restricted endpoints.
