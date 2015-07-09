<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Project_arrives_in_organization</fullName>
        <description>Project arrives in organization</description>
        <protected>false</protected>
        <recipients>
            <field>Project_Manager_Contact__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/New_Project_Created</template>
    </alerts>
    <alerts>
        <fullName>Project_due_date_is_after_5_days</fullName>
        <description>Project due date is after 5 days.</description>
        <protected>false</protected>
        <recipients>
            <field>Project_Manager_Contact__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Project_Due_date</template>
    </alerts>
    <fieldUpdates>
        <fullName>Project_Status_Closed</fullName>
        <description>Set Project status as closed if project end date is today.</description>
        <field>Status__c</field>
        <literalValue>Closed</literalValue>
        <name>Project Status Closed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Change Status To Closed%2E</fullName>
        <actions>
            <name>Project_Status_Closed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>If project end date is today. Status is set to closed.</description>
        <formula>ISCHANGED( Date__c )  &amp;&amp;   End_Date__c =  Date__c</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Project Due date</fullName>
        <active>true</active>
        <description>Project due date information.</description>
        <formula>TRUE</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Project_due_date_is_after_5_days</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Project__c.End_Date__c</offsetFromField>
            <timeLength>-5</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Project Record Is Created</fullName>
        <active>true</active>
        <description>Send Email alert when project arrives in organization.</description>
        <formula>TRUE</formula>
        <triggerType>onCreateOnly</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Project_arrives_in_organization</name>
                <type>Alert</type>
            </actions>
            <actions>
                <name>New_project_assignment</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Project__c.CreatedDate</offsetFromField>
            <timeLength>0</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <tasks>
        <fullName>New_project_assignment</fullName>
        <assignedTo>shubhangi.sardar@eternus.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Project__c.End_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>New project assignment</subject>
    </tasks>
</Workflow>
