import com.liferay.portal.service.OrganizationLocalServiceUtil;
import com.liferay.portal.theme.ThemeDisplay;
import com.liferay.portal.util.WebKeys;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.ServiceContextFactory;
import com.liferay.portal.model.Organization;

ThemeDisplay themeDisplay = (ThemeDisplay) actionRequest.getAttribute(
	WebKeys.THEME_DISPLAY);

long userId = themeDisplay.getUserId();

String defaultOrganizationName = "Organization";

ServiceContext serviceContext = ServiceContextFactory.getInstance(
	Organization.class.getName(), actionRequest);

for (int i = 0; i <=1000; i++) {
	OrganizationLocalServiceUtil.addOrganization(
	userId,
	0,
	defaultOrganizationName + String.valueOf(i),
	"regular-organization",
	false,
	0,
	0,
	12017,
	"",
	false,
	serviceContext
	)

	System.out.println("Organization " + i);
}