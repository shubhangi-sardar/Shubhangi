<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Quantity_update</fullName>
        <description>Update quantity on media on each purchase.</description>
        <field>Quantity__c</field>
        <formula>Media_Name__r.Quantity__c  -  Quantity__c</formula>
        <name>Quantity update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>Media_Name__c</targetObject>
    </fieldUpdates>
    <rules>
        <fullName>Quantity field update</fullName>
        <actions>
            <name>Quantity_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Media_Line_Item__c.Quantity__c</field>
            <operation>notEqual</operation>
            <value>0</value>
        </criteriaItems>
        <description>Update media quantity on each purchase.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
