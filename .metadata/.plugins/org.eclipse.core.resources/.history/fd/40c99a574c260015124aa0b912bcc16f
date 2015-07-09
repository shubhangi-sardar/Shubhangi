<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Stock_Alert</fullName>
        <description>Stock Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>shubhangi.sardar@eternus.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Media_Stock_Alert</template>
    </alerts>
    <rules>
        <fullName>Maintain_Stock</fullName>
        <actions>
            <name>Stock_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Media_Inventory__c.Quantity__c</field>
            <operation>lessOrEqual</operation>
            <value>10</value>
        </criteriaItems>
        <description>If media stock is below 10, give email notification to update refill stock.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
