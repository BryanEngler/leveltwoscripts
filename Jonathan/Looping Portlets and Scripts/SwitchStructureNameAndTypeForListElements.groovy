import com.liferay.portlet.journal.model.JournalStructure;
import com.liferay.portlet.journal.service.JournalStructureLocalServiceUtil;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import java.io.StringReader;
import java.io.StringWriter;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

List<JournalStructure> structures = JournalStructureLocalServiceUtil.getStructures();

for (JournalStructure structure : structures) {
	String xml = structure.getXsd();

	DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
	DocumentBuilder builder = factory.newDocumentBuilder();
	InputSource is = new InputSource(new StringReader(xml));
	Document document = builder.parse(is);

	NodeList dynamicElementsList = document.getElementsByTagName("dynamic-element");

	for (int i = 0; i < dynamicElementsList.getLength(); i++) {
		Element dynamicElement = (Element)dynamicElementsList.item(i);

		if (!dynamicElement.getAttribute("type").equalsIgnoreCase("list")) {
			continue;
		}

		NodeList dynamicElementsChildList = dynamicElement.getChildNodes();

		for (int j = 0; j < dynamicElementsChildList.getLength(); j++) {
			Node childNode = dynamicElementsChildList.item(j);

			if (childNode.getNodeType() == Node.ELEMENT_NODE) {
				Element currentChildNodeElement = (Element)childNode;

				String name = currentChildNodeElement.getAttribute("name");
				String type = currentChildNodeElement.getAttribute("type");

				currentChildNodeElement.setAttribute("name", type);
				currentChildNodeElement.setAttribute("type", name);
			}
		}
	}

	TransformerFactory transfac = TransformerFactory.newInstance();
	Transformer trans = transfac.newTransformer();
	trans.setOutputProperty(OutputKeys.INDENT, "yes");

	StringWriter sw = new StringWriter();
	StreamResult result = new StreamResult(sw);
	DOMSource source = new DOMSource(document);
	trans.transform(source, result);
	String xmlString = sw.toString();

	structure.setXsd(xmlString);

	JournalStructureLocalServiceUtil.updateJournalStructure(structure);
}