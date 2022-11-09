# Active directory

- Azure Active Directory is a cloud-based identity provider and access management service.
- Azure Active directory helps employees access external resources, such as Microsoft 365, the Azure portal, and thousands of other SaaS applications and access internal resources like apps on your corporate intranet network, along with any cloud apps developed for your own organization.

**Who Uses Azure AD**

- IT Domain
- App Developers
- Microsoft 365, Office 365, Azure, or Dynamics CRM Online subscribers.


    - IT admin, use Azure AD to control access to your apps and your app resources, based on your business requirements.
    - App developer, you can use Azure AD as a standards-based approach for adding single sign-on (SSO) to your app, allowing it to work with a user's pre-existing credentials. Azure AD also provides APIs that can help you build personalized app experiences using existing organizational data.
    - As a subscriber, you're already using Azure AD. Each Microsoft 365, Office 365, Azure, and Dynamics CRM Online tenant is automatically an Azure AD tenant. You can immediately start to manage access to your integrated cloud apps.


    # Source

    (https://learn.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-whatis)

    (https://learn.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-access-create-new-tenant?source=recommendations)


    # Exercise:

    - Creating Active Directory Tenanat:

    ![alt test](00_includes/Azure3week3/AD1newuser.png "AD1newuser.png")

    - New user created Apple Box

    ![alt test](../00_includes/Azure3week3/AD2newuseracc.png "AD2newuseracc.png")


    - Loged into Azureportal as Apple:


    ![alt test](../00_includes/Azure3week3/AD3appledirec.png "AD3appledirec.png")


    ![alt test](../00_includes/Azure3week3/AD4applerole.png "AD4applerole.png")

    - Creating New teanat:


    ![alt test](../00_includes/Azure3week3/AD5newten.png "AD5newten.png")


    - Giving Global Adminstarive permissions to the user(Apple)



    ![alt test](../00_includes/Azure3week3/AD6myorg.png "AD6myorg.png")



    ![alt test](../00_includes/Azure3week3/AD7glob.png "AD7glob.png")




    - Creating Groups to New Tenant(Apple)


    ![alt test](../00_includes/Azure3week3/AD1group.png "AD1group.png")


    ![alt test](../00_includes/Azure3week3/AD2groups.png "AD2groups.png")


    ![alt test](../00_includes/Azure3week3/AD3groups.png "AD3groups.png")


    - Assining role to the group.

    ![alt test](../00_includes/Azure3week3/AD4applerole.png "AD4applerole.png")



    ![alt test](../00_includes/Azure3week3/AD5groups.png "AD5groups.png")