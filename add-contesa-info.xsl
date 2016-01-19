<?xml version="1.0" encoding="UTF-8"?>
<stylesheet 
   version="2.0"
   xmlns:sch="http://purl.oclc.org/dsdl/schematron" 
   xmlns="http://www.w3.org/1999/XSL/Transform">

  <output method="xml" version="1.0" indent="no"/>

  <variable name="ndr-url">http://reference.niem.gov/niem/specification/naming-and-design-rules/3.0/NIEM-NDR-3.0-2014-07-31.html</variable>

  <template match="sch:pattern[@id]">
    <copy>
      <apply-templates select="@*|sch:title"/>
      <text></text>
      <sch:p>
        <value-of select="$ndr-url"/>
        <text>#</text>
        <value-of select="@id"/>
      </sch:p>
      <apply-templates select="node()[empty(self::sch:title)]"/>
    </copy>
  </template>

  <!-- just copy everything else -->
  <template match="@*|node()" priority="-1">
    <copy>
      <apply-templates select="@*|node()"/>
    </copy>
  </template>

</stylesheet>
<!--
Local Variables:
mode: sgml
indent-tabs-mode: nil
fill-column: 9999
End:
-->
