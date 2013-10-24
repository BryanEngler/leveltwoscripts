import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.theme.ThemeDisplay;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.ServiceContextFactory;
import com.liferay.portlet.asset.model.AssetCategory;
import com.liferay.portlet.asset.model.AssetCategoryConstants;
import com.liferay.portlet.asset.service.AssetCategoryLocalServiceUtil;

ThemeDisplay themeDisplay = (ThemeDisplay) actionRequest.getAttribute(
	WebKeys.THEME_DISPLAY);

long userId = themeDisplay.getUserId();

long parentCategoryId =
	AssetCategoryConstants.DEFAULT_PARENT_CATEGORY_ID;

long vocabularyId = 17505; // Change this

Map<Locale, String> titleMap = new HashMap<Locale, String>();
Map<Locale, String> descriptionMap = new HashMap<Locale, String>();

String[] categoryProperties;

ServiceContext serviceContext = ServiceContextFactory.getInstance(
	AssetCategory.class.getName(), actionRequest);

String defaultTitle = "category";

for (int i = 0; i < 100; i++) {
	String title = defaultTitle + i;
	String description = defaultTitle + i;

	titleMap.put(Locale.getDefault(), title);
	descriptionMap.put(Locale.getDefault(), description);

	AssetCategoryLocalServiceUtil.addCategory(
		userId, parentCategoryId, titleMap, descriptionMap,
		vocabularyId, categoryProperties, serviceContext);
}