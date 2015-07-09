<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Follow_Up_Date_Has_Been_Elapsed</fullName>
        <description>Follow Up Date Has Been Elapsed</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Follow_Up_Date</template>
    </alerts>
    <fieldUpdates>
        <fullName>DNC_Record_Type_Update</fullName>
        <description>Update DNC record type based on do not call field on lead object</description>
        <field>RecordTypeId</field>
        <lookupValue>DNC</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>DNC Record Type Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Landline_Record_Type_Update</fullName>
        <description>When phone field is not null, record is in Landline</description>
        <field>RecordTypeId</field>
        <lookupValue>Landline</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Landline Record Type Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Mobile_Record_Type_Update</fullName>
        <description>Record goes to Mobile record type</description>
        <field>RecordTypeId</field>
        <lookupValue>Mobile</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Mobile Record Type Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>No_Number_Record_Type_Update</fullName>
        <description>When no number, send record to no number record type.</description>
        <field>RecordTypeId</field>
        <lookupValue>No_Number</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>No Number Record Type Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Follow Up Date Elapsed</fullName>
        <actions>
            <name>Follow_Up_Date_Has_Been_Elapsed</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Inform follow up date if it has been elapsed.</description>
        <formula>ISCHANGED( Date__c )  &amp;&amp; Follow_Up_Of_Date__c &gt;  Date__c</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Record Type Landline</fullName>
        <actions>
            <name>Landline_Record_Type_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Phone</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Update record type landline if phone field is not empty.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Record Type Mobile</fullName>
        <actions>
            <name>Mobile_Record_Type_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.MobilePhone</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>When field is updated record will go to Mobile record types.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Record Type No Number</fullName>
        <actions>
            <name>No_Number_Record_Type_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.MobilePhone</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Phone</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>If no number is given update record to no number record type.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Record Types DND</fullName>
        <actions>
            <name>DNC_Record_Type_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.DoNotCall</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Update record types based on 4 fields of Lead object.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
