<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet
  xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
  version='2.0'
>
  <xsl:template name="domain">
    <domain type="kvm">
      <xsl:variable name="title" select="attrs/attr[@name='title']/*/@value" />
      <xsl:variable name="description" select="attrs/attr[@name='description']/*/@value" />
      <xsl:variable name="uuid" select="attrs/attr[@name='uuid']/*/@value" />

      <name><xsl:value-of select="@name"/></name>
      <xsl:if test="$uuid">
        <uuid><xsl:value-of select="$uuid"/></uuid>
      </xsl:if>
      <xsl:if test="$title">
        <title><xsl:value-of select="$title"/></title>
      </xsl:if>
      <xsl:if test="$description">
        <description><xsl:value-of select="$description"/></description>
      </xsl:if>
      <vcpu><xsl:value-of select="attrs/attr[@name='smp']/*/@value"/></vcpu>
      <cpu mode="host-passthrough">
      </cpu>
      <os>
        <type>
          <xsl:variable name="arch" select="attrs/attr[@name='arch']/*/@value" />
          <xsl:variable name="machine" select="attrs/attr[@name='machine']/*/@value" />

          <xsl:if test="$arch">
            <xsl:attribute name="arch">
              <xsl:value-of select="$arch"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="$machine">
            <xsl:attribute name="machine">
              <xsl:value-of select="$machine"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:text>hvm</xsl:text>
        </type>
        <xsl:for-each select="attrs/attr[@name='bootOrder']/list/string">
          <boot dev="{@value}"/>
        </xsl:for-each>
        <bootmenu enable='yes'/>
        <xsl:if test="(attrs/attr[@name='firmware']/*/@value = 'efi')">
          <loader readonly="yes" secure="yes" type="pflash">@edk2@/FV/OVMF.fd</loader>
          <nvram template='@edk2@/FV/OVMF.fd'>@storage@/nvram/<xsl:value-of select='@name' />.fd</nvram>
          <firmware>
            <feature enabled="yes" name="secure-boot"/>
            <feature enabled="yes" name="enrolled-keys"/>
          </firmware>
        </xsl:if>
      </os>
      <features>
        <acpi/>
        <apic/>
        <kvm>
          <hidden state='on'/>
        </kvm>
        <vmport state='off'/>
        <smm state='on'/>
      </features>

      <xsl:for-each select="attrs/attr[@name='memory']/attrs">
        <memory>
          <xsl:attribute name="unit">
            <xsl:value-of select="attr[@name='unit']/*/@value"/>
          </xsl:attribute>
          <xsl:value-of select="attr[@name='value']/*/@value"/>
        </memory>
      </xsl:for-each>

      <devices>
        <xsl:for-each select="attrs/attr[@name='renderedDevices']/list/attrs">
          <xsl:value-of select="attr[@name='deviceStanza']/*/@value" disable-output-escaping="yes" />
        </xsl:for-each>

        <xsl:for-each select="attrs/attr[@name='rawDisks']/list/attrs">
          <xsl:variable name="device" select="attr[@name='device']/*/@value" />

          <xsl:variable name="driverName" select="attr[@name='driverName']/*/@value" />
          <xsl:variable name="driverType" select="attr[@name='driverType']/*/@value" />

          <xsl:variable name="sourceFile" select="attr[@name='sourceFile']/*/@value" />

          <xsl:variable name="targetBus" select="attr[@name='targetBus']/*/@value" />
          <xsl:variable name="targetDev" select="attr[@name='targetDev']/*/@value" />
          <xsl:variable name="readOnly" select="attr[@name='readOnly']/bool[@value='true']" />

          <disk type="file">
            <xsl:if test="$device">
              <xsl:attribute name="device">
                <xsl:value-of select="$device"/>
              </xsl:attribute>
            </xsl:if>

            <driver name="{$driverName}" type="{$driverType}"/>
            <xsl:if test="$readOnly">
              <readonly/>
            </xsl:if>
            <xsl:choose>
              <xsl:when test="$sourceFile">
                <source file="{$sourceFile}"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:message terminate="yes">
                  Only type="file" disks are supported right now. You must specify a sourceFile.
                </xsl:message>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="$targetBus or $targetDev">
              <target>
                <xsl:if test="$targetBus">
                  <xsl:attribute name="bus">
                    <xsl:value-of select="$targetBus"/>
                  </xsl:attribute>
                </xsl:if>
                <xsl:if test="$targetDev">
                  <xsl:attribute name="dev">
                    <xsl:value-of select="$targetDev"/>
                  </xsl:attribute>
                </xsl:if>
              </target>
            </xsl:if>
          </disk>
        </xsl:for-each>
        <xsl:if test="not(attrs/attr[@name='balloon']/bool/@value)">
          <memballoon model="none"></memballoon>
        </xsl:if>
      </devices>
    </domain>
  </xsl:template>

  <xsl:template match="/">

    <!-- For each machine, generate a libvirt KVM domain -->
    <xsl:for-each select="/expr/attrs/attr">
      <xsl:result-document
        href="domain_{@name}.xml"
        method="xml" indent="yes"
      >
        <xsl:call-template name="domain"/>
      </xsl:result-document>
    </xsl:for-each>

  </xsl:template>
</xsl:stylesheet>
<!-- vim: set et ts=2 sw=2: -->
