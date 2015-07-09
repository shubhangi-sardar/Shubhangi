<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Employee_is_inactive_in_organization</fullName>
        <description>Employee is inactive in organization.</description>
        <protected>false</protected>
        <recipients>
            <field>Manager_Contact__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Employee_is_inactive_in_organization</template>
    </alerts>
    <fieldUpdates>
        <fullName>Auto_Populate_Manager_Email</fullName>
        <description>It auto populates manager&apos;s email on employee object.</description>
        <field>Manager_Contact__c</field>
        <formula>Manager__r.Email__c</formula>
        <name>Auto Populate Manager Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Record_Type_To_Non_Technical</fullName>
        <description>Change employee record type to non technical.</description>
        <field>RecordTypeId</field>
        <lookupValue>Non_Technical_Employee</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Change Record Type To Non Technical</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Employee_Inactive</fullName>
        <description>Update Is On Notice Period field to false</description>
        <field>Is_on_Notice_Period__c</field>
        <literalValue>0</literalValue>
        <name>Employee Inactive</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Employee_Is_Inactive</fullName>
        <description>Make Is Active checkbox false.</description>
        <field>Is_Active__c</field>
        <literalValue>0</literalValue>
        <name>Employee Is Inactive</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>One_To_One_Relationship</fullName>
        <description>Update Related To Roll field to associated employee ID</description>
        <field>Related_To_Role__c</field>
        <formula>Role_Name__r.Name</formula>
        <name>One To One Relationship</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Is_Active</fullName>
        <description>If joining date is present, update field is active.</description>
        <field>Is_Active__c</field>
        <literalValue>1</literalValue>
        <name>Update Is Active</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Is_On_Notice_Period</fullName>
        <description>Update field if employee is on notice period.</description>
        <field>Is_on_Notice_Period__c</field>
        <literalValue>1</literalValue>
        <name>Update Is On Notice Period</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Change Record Type To Non Technical</fullName>
        <actions>
            <name>Change_Record_Type_To_Non_Technical</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Employee__c.Current_Employee__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>If current employee checkbox is disabled it change record type to non technical.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Employee Is Inactive</fullName>
        <actions>
            <name>Employee_is_inactive_in_organization</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Auto_Populate_Manager_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Employee_Inactive</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Employee_Is_Inactive</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Employee is inactive in organization. Send email to Manager.</description>
        <formula>Is_Active__c = True &amp;&amp;  Is_on_Notice_Period__c = true &amp;&amp;    Last_Working_Day__c &lt;  Date__c &amp;&amp;  ISBLANK( Date_of_Joining__c )= False &amp;&amp;  ISBLANK(Resignation_Date__c) = False</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Employee_Is_ Active_Or_Not</fullName>
        <actions>
            <name>Update_Is_Active</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Update if employee is active.</description>
        <formula>ISBLANK( Date_of_Joining__c ) = False &amp;&amp;  Date_of_Joining__c  &lt;=  Date__c</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Employee_Is_On_Notice_Period</fullName>
        <actions>
            <name>Update_Is_On_Notice_Period</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Update if employee is on notice period based on resignation date.</description>
        <formula>ISBLANK( Date_of_Joining__c ) = False &amp;&amp;  ISBLANK( Resignation_Date__c ) = False &amp;&amp;  Resignation_Date__c &gt;=  Date__c &amp;&amp;  Resignation_Date__c &lt;=  Last_Working_Day__c</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>One TO One Between Employee And Role</fullName>
        <actions>
            <name>One_To_One_Relationship</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Employee__c.Is_Active__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Create one to one relationship between Employee and Roll object.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
