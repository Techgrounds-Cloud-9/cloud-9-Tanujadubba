# Architected Framework
- The Azure Well-Architected Framework is a set of guiding tenets that can be used to improve the quality of a workload

- The framework consists of five pillars of architectural excellence:

  - Reliability: Reliability	The ability of a system to recover from failures and continue to function.
  - Security:	Protecting applications and data from threats.
  - Cost Optimization:	Managing costs to maximize the value delivered.
  - Operational Excellence:	Operations processes that keep a system running in production.
  - Performance Efficiency:	The ability of a system to adapt to changes in load.


- To assess your workload using the tenets found in the Microsoft Azure Well-Architected Framework.
- It is also advisable to use Azure Advisor and Advisor Score to identify and prioritize opportunities to improve the posture of your workloads. Both services are free to all Azure users and align to the five pillars of the Well-Architected Framework.


# What is Advisor?
 - Advisor is a personalized cloud consultant that helps you follow best practices to optimize your Azure deployments. It analyzes your resource configuration and usage telemetry and then recommends solutions that can help you improve the cost effectiveness, performance, Reliability (formerly called High availability), and security of your Azure resources.

   - Get proactive, actionable, and personalized best practices recommendations.
   - Improve the performance, security, and reliability of your resources, as you identify opportunities to reduce your overall Azure spend.
   - Get recommendations with proposed actions inline.

# Advisor score

- Azure Advisor provides best practice recommendations for your workloads. These recommendations are personalized and actionable to help you:

  - Improve the posture of your workloads and optimize your Azure deployments.
  - Proactively prevent top issues by following best practices.
  - Assess your Azure workloads against the five pillars of the Microsoft Azure Well-Architected Framework.

# Reliability
 - A reliable workload is one that is both resilient and available. Resiliency is the ability of the system to recover from failures and continue to function. The goal of resiliency is to return the application to a fully functioning state after a failure occurs. Availability is whether your users can access your workload when they need to.

   **Reliability guidance:**

     - Designing reliable Azure applications
     - Design patterns for resiliency
     - Best practices:
        - Transient fault handling
        - Retry guidance for specific services

  **Reliability design principles:**
     - Context for questions
     - Why a certain aspect is important
     - How an aspect is applicable to Reliability
# Security
- Think about security throughout the entire lifecycle of an application, from design and implementation to deployment and operations. The Azure platform provides protections against various threats, such as network intrusion and DDoS attacks


**Security guidance:**

  - Identity management
  - Protect your infrastructure
  - Application security
  - Data sovereignty and encryption
  - Security resources

**Security design principles:**
- Security is one of the most important aspects of any architecture. It provides the following assurances against deliberate attacks and abuse of your valuable data and systems:

   - Confidentiality
   - Integrity
   - Availability

# Cost optimization
 - When you're designing a cloud solution, focus on generating incremental value early. Apply the principles of Build-Measure-Learn, to accelerate your time to market while avoiding capital-intensive solutions.

**Cost guidance:**
   - Review cost principles
   - Develop a cost model
   - Create budgets and alerts
   - Review the cost optimization checklist 

**Cost optimization principles:**

  - The cost optimization pillar provides principles for balancing business goals with budget justification to create a cost-effective workload while avoiding capital-intensive solutions.
  - Use the cost calculators to estimate the initial cost and operational costs. 

# Operational excellence
 - Operational excellence covers the operations and processes that keep an application running in production. Deployments must be reliable and predictable. Automate deployments to reduce the chance of human error.

**Operational excellence guidance:**

   - Design patterns for operational excellence
   - Best practices: Monitoring and diagnostics

**Operational excellence guidance principles:**

 - The operational excellence pillar covers the operations processes that keep an application running in production. Deployments must be reliable and predictable.
 - Fast and routine deployment processes won't slow down the release of new features or bug fixes.

# Performance efficiency
 - Performance efficiency is the ability of your workload to scale to meet the demands placed on it by users in an efficient manner. The main ways to achieve performance efficiency include using scaling appropriately and implementing PaaS offerings that have scaling built in.

**Performance efficiency guidance:**

  - Design patterns for performance efficiency
     - Best practices:
        - Autoscaling
        - Background jobs
        - Caching
        - CDN
        - Data partitioning

**Performance efficiency principles:**

- when it came to planning how a system would handle increases in load, many organizations intentionally provisioned oversized workloads to meet business requirements. This decision made sense in on-premises environments because it ensured capacity during peak usage.





  # Source:
  (https://learn.microsoft.com/en-us/azure/architecture/framework/)

  (https://www.youtube.com/watch?v=BF1Tw9MNa5U)

  (https://learn.microsoft.com/en-us/azure/advisor/advisor-overview)

  (https://learn.microsoft.com/en-us/azure/advisor/azure-advisor-score)

  (https://learn.microsoft.com/en-us/azure/architecture/framework/security/overview)