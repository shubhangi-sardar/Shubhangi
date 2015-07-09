<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Big_Deal_Alert_Email</fullName>
        <description>Big Deal Alert Email</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Big_Deal_Alert</template>
    </alerts>
    <rules>
        <fullName>Big Deal Alert</fullName>
        <actions>
            <name>Big_Deal_Alert_Email</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Amount</field>
            <operation>greaterOrEqual</operation>
            <value>50000</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Negotiation/Review</value>
        </criteriaItems>
        <description>Inform about deal greater than 50k.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
