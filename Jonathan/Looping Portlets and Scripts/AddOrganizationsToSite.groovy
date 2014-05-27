import com.liferay.portal.service.persistence.GroupUtil;
import com.liferay.portal.service.OrganizationLocalServiceUtil;
import com.liferay.portal.model.Organization;

String defaultOrganizationName = "Organization";

List<Organization> organizations = new ArrayList<Organization>();

for (int i = 0; i <=1000; i++) {
	Organization org = OrganizationLocalServiceUtil.getOrganization(10154, defaultOrganizationName + String.valueOf(i))

	organizations.add(org);

	System.out.println(i);
}

GroupUtil.addOrganizations(10180, organizations);