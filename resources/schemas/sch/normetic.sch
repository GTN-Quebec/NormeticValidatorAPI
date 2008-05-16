<?xml version="1.0" encoding="utf-8"?>
<!-- 

    Schematron schema file validating Normetic application profile v1.1.
    Written by: Frédéric Bergeron <frederic.bergeron@licef.teluq.uqam.ca>
    Date: 2007/05

-->
<iso:schema    
  xmlns="http://purl.oclc.org/dsdl/schematron"
  xmlns:iso="http://purl.oclc.org/dsdl/schematron" 
  xmlns:dp="http://www.dpawson.co.uk/ns#"
  queryBinding='xslt2'
  schemaVersion='ISO19757-3'
  defaultPhase='#ALL'>

    <iso:title>Normetic Schematron File</iso:title>

    <iso:ns prefix='lom' uri='http://ltsc.ieee.org/xsd/LOM'/>
    <iso:ns prefix='vdx' uri='http://www.imsglobal.org/xsd/imsvdex_v1p0'/>

    <iso:phase id="MandatoryCategories">
        <iso:active pattern="MandatoryCategories.All"/>
    </iso:phase>

    <iso:phase id="MandatoryElements">
        <iso:active pattern="MandatoryElements.General"/>
        <iso:active pattern="MandatoryElements.LifeCycle"/>
        <iso:active pattern="MandatoryElements.MetaMetadata"/>
        <iso:active pattern="MandatoryElements.Technical"/>
        <iso:active pattern="MandatoryElements.Educational"/>
        <iso:active pattern="MandatoryElements.Rights"/>
        <!--iso:active pattern="MandatoryElements.Relation"/-->
        <!--iso:active pattern="MandatoryElements.Annotation"/-->
        <iso:active pattern="MandatoryElements.Classification"/>
    </iso:phase>

    <!--
        Some constraints cannot be validated in one phase using Schematron.
        It may be required to execute a second phase for further validation.
        In such a case, a rule will throw a warning message accordingly.
    -->
    <iso:phase id="ConditionalMandatoryElements">
        <iso:active pattern="ConditionalMandatoryElements.General"/>
        <iso:active pattern="ConditionalMandatoryElements.LifeCycle"/>
        <!--iso:active pattern="ConditionalMandatoryElements.MetaMetadata"/-->
        <!--iso:active pattern="ConditionalMandatoryElements.Technical"/-->
        <!--iso:active pattern="ConditionalMandatoryElements.Educational"/-->
        <iso:active pattern="ConditionalMandatoryElements.Rights"/>
        <!--iso:active pattern="ConditionalMandatoryElements.Relation"/-->
        <!--iso:active pattern="ConditionalMandatoryElements.Annotation"/-->
        <!--iso:active pattern="ConditionalMandatoryElements.Classification"/-->
    </iso:phase>

    <!--
        This phase is optional and should only be executed if necessary.
    -->
    <iso:phase id="ConditionalMandatoryElements.2">
        <iso:active pattern="ConditionalMandatoryElements.General.2"/>
        <!--iso:active pattern="ConditionalMandatoryElements.LifeCycle.2"/-->
        <!--iso:active pattern="ConditionalMandatoryElements.MetaMetadata.2"/-->
        <!--iso:active pattern="ConditionalMandatoryElements.Technical.2"/-->
        <!--iso:active pattern="ConditionalMandatoryElements.Educational.2"/-->
        <!--iso:active pattern="ConditionalMandatoryElements.Rights.2"/-->
        <!--iso:active pattern="ConditionalMandatoryElements.Relation.2"/-->
        <!--iso:active pattern="ConditionalMandatoryElements.Annotation.2"/-->
        <!--iso:active pattern="ConditionalMandatoryElements.Classification.2"/-->
    </iso:phase>

    <iso:phase id="RecommendedCategories">
        <iso:active pattern="RecommendedCategories.All"/>
    </iso:phase>

    <iso:phase id="RecommendedElements">
        <iso:active pattern="RecommendedElements.General"/>
        <iso:active pattern="RecommendedElements.LifeCycle"/>
        <!--iso:active pattern="RecommendedElements.MetaMetadata"/-->
        <iso:active pattern="RecommendedElements.Technical"/>
        <iso:active pattern="RecommendedElements.Educational"/>
        <!--iso:active pattern="RecommendedElements.Rights"/-->
        <iso:active pattern="RecommendedElements.Relation"/>
        <!--iso:active pattern="RecommendedElements.Annotation"/-->
        <!--iso:active pattern="RecommendedElements.Classification"/-->
    </iso:phase>

    <iso:phase id="Vocabularies">
        <!--iso:active pattern="Vocabularies.General"/-->
        <!--iso:active pattern="Vocabularies.LifeCycle"/-->
        <!--iso:active pattern="Vocabularies.MetaMetadata"/-->
        <!--iso:active pattern="Vocabularies.Technical"/-->
        <iso:active pattern="Vocabularies.Educational"/>
        <!--iso:active pattern="Vocabularies.Rights"/-->
        <!--iso:active pattern="Vocabularies.Relation"/-->
        <!--iso:active pattern="Vocabularies.Annotation"/-->
        <!--iso:active pattern="Vocabularies.Classification"/-->
    </iso:phase>

    <iso:phase id="LanguageAttributes">
        <iso:active pattern="LanguageAttributes.General"/>
        <iso:active pattern="LanguageAttributes.LifeCycle"/>
        <!--iso:active pattern="LanguageAttributes.MetaMetadata"/-->
        <iso:active pattern="LanguageAttributes.Technical"/>
        <iso:active pattern="LanguageAttributes.Educational"/>
        <iso:active pattern="LanguageAttributes.Rights"/>
        <iso:active pattern="LanguageAttributes.Relation"/>
        <iso:active pattern="LanguageAttributes.Annotation"/>
        <iso:active pattern="LanguageAttributes.Classification"/>
    </iso:phase>

    <iso:pattern id="MandatoryCategories.All">
        <iso:title>Validating mandatory categories</iso:title>
        <iso:rule context="lom:lom">
            <iso:assert test="lom:general" diagnostics="GeneralCategoryMandatory">GeneralCategoryMandatory</iso:assert>
            <iso:assert test="lom:lifeCycle" diagnostics="LifeCycleCategoryMandatory">LifeCycleCategoryMandatory</iso:assert>
            <iso:assert test="lom:metaMetadata" diagnostics="MetaMetaDataCategoryMandatory">MetaMetaDataCategoryMandatory</iso:assert>
            <iso:assert test="lom:technical" diagnostics="TechnicalCategoryMandatory">TechnicalCategoryMandatory</iso:assert>
            <iso:assert test="lom:educational" diagnostics="EducationalCategoryMandatory">EducationalCategoryMandatory</iso:assert>
            <iso:assert test="lom:rights" diagnostics="RightsCategoryMandatory">RightsCategoryMandatory</iso:assert>
            <iso:assert test="lom:classification" diagnostics="ClassificationCategoryMandatory">ClassificationCategoryMandatory</iso:assert>
        </iso:rule>
    </iso:pattern>

    <iso:pattern id="MandatoryElements.General">
        <iso:title>Validating General category's mandatory elements</iso:title>
        <iso:rule context="lom:lom/lom:general">
            <iso:assert test="lom:title" diagnostics="Element1.2UndefinedMandatory">Element1.2UndefinedMandatory</iso:assert>
            <iso:assert test="lom:language" diagnostics="Element1.3UndefinedMandatory">Element1.3UndefinedMandatory</iso:assert>
            <iso:assert test="lom:description" diagnostics="Element1.4UndefinedMandatory">Element1.4UndefinedMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:general/lom:title">
            <iso:assert test="normalize-space() != ''" diagnostics="Element1.2EmptyMandatory">Element1.2EmptyMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:general/lom:language">
            <iso:assert test="normalize-space() != ''" diagnostics="Element1.3EmptyMandatory">Element1.3EmptyMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:general/lom:description">
            <iso:assert test="normalize-space() != ''" diagnostics="Element1.4EmptyMandatory">Element1.4EmptyMandatory</iso:assert>
        </iso:rule>
    </iso:pattern>

    <iso:pattern id="ConditionalMandatoryElements.General">
        <iso:title>Validating General category's conditional mandatory elements</iso:title>
        <iso:rule context="lom:lom/lom:general">
            <iso:assert test="lom:keyword and string-length( string-join( for $s in lom:keyword/lom:string return( normalize-space( $s ) ), '' ) ) > 0" diagnostics="Element1.5UndefinedOrEmptyPhase2Required">Element1.5UndefinedOrEmptyPhase2Required</iso:assert>
        </iso:rule>
    </iso:pattern>

    <iso:pattern id="ConditionalMandatoryElements.General.2">
        <iso:title>Validating General category's conditional mandatory elements (phase 2)</iso:title>
        <iso:rule context="lom:lom">
            <iso:let name="validNodes" value="//lom:classification/lom:purpose/lom:value[normalize-space(text())='discipline' or normalize-space(text())='idea']"/>
            <iso:assert test="count($validNodes) > 0" diagnostics="Element1.5UndefinedOrEmptyMandatory">Element1.5UndefinedOrEmptyMandatory</iso:assert>
        </iso:rule>
    </iso:pattern>

    <iso:pattern id="RecommendedCategories.All">
        <iso:title>Validating recommended categories</iso:title>
        <iso:rule context="lom:lom">
            <iso:assert test="lom:relation" diagnostics="RelationCategoryRecommended">RelationCategoryRecommended</iso:assert>
        </iso:rule>
    </iso:pattern>

    <iso:pattern id="RecommendedElements.General">
        <iso:title>Validating General category's recommended elements</iso:title>
        <iso:rule context="lom:lom/lom:general">
            <iso:assert test="lom:identifier" diagnostics="Element1.1UndefinedRecommended">Element1.1UndefinedRecommended</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:general/lom:identifier">
            <iso:assert test="lom:catalog" diagnostics="Element1.1.1UndefinedRecommended">Element1.1.1UndefinedRecommended</iso:assert>
            <iso:assert test="lom:entry" diagnostics="Element1.1.2UndefinedRecommended">Element1.1.2UndefinedRecommended</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:general/lom:identifier/lom:catalog">
            <iso:assert test="normalize-space() != ''" diagnostics="Element1.1.1EmptyRecommended">Element1.1.1EmptyRecommended</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:general/lom:identifier/lom:entry">
            <iso:assert test="normalize-space() != ''" diagnostics="Element1.1.2EmptyRecommended">Element1.1.2EmptyRecommended</iso:assert>
        </iso:rule>
    </iso:pattern>

    <iso:pattern id="MandatoryElements.LifeCycle">
        <iso:title>Validating LifeCycle category's mandatory elements</iso:title>
        <iso:rule context="lom:lom/lom:lifeCycle">
            <iso:assert test="lom:version" diagnostics="Element2.1UndefinedMandatory">Element2.1UndefinedMandatory</iso:assert>
            <iso:assert test="lom:contribute" diagnostics="Element2.3UndefinedMandatory">Element2.3UndefinedMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:lifeCycle/lom:version">
            <iso:assert test="normalize-space() != ''" diagnostics="Element2.1EmptyMandatory">Element2.1EmptyMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:lifeCycle/lom:contribute">
            <iso:assert test="lom:role" diagnostics="Element2.3.1UndefinedMandatory">Element2.3.1UndefinedMandatory</iso:assert>
            <iso:assert test="lom:entity" diagnostics="Element2.3.2UndefinedMandatory">Element2.3.2UndefinedMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:lifeCycle/lom:contribute/lom:role">
            <iso:assert test="normalize-space() != ''" diagnostics="Element2.3.1EmptyMandatory">Element2.3.1EmptyMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:lifeCycle/lom:contribute/lom:entity">
            <iso:assert test="normalize-space() != ''" diagnostics="Element2.3.2EmptyMandatory">Element2.3.2EmptyMandatory</iso:assert>
        </iso:rule>
    </iso:pattern>

    <iso:pattern id="ConditionalMandatoryElements.LifeCycle">
        <iso:title>Validating LifeCycle category's conditional mandatory elements</iso:title>
        <iso:rule context="lom:lom/lom:lifeCycle">
            <iso:assert test="count(lom:contribute/lom:date) > 0 and (string-length( string-join( for $s in lom:contribute/lom:date/lom:dateTime return( normalize-space( $s ) ), '' ) ) > 0 or //lom:date/lom:description/lom:string[normalize-space(text())='non disponible'] )" diagnostics="Element2.3.3UndefinedMandatory">Element2.3.3UndefinedMandatory</iso:assert>
        </iso:rule>
    </iso:pattern>

    <!--iso:pattern id="ConditionalMandatoryElements.LifeCycle.2">
        <iso:title>Validating LifeCycle category's conditional mandatory elements (phase 2)</iso:title>
    </iso:pattern-->

    <iso:pattern id="RecommendedElements.LifeCycle">
        <iso:title>Validating LifeCycle category's recommended elements</iso:title>
        <iso:rule context="lom:lom/lom:lifeCycle">
            <iso:assert test="lom:status" diagnostics="Element2.2UndefinedRecommended">Element2.2UndefinedRecommended</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:lifeCycle/lom:status">
            <iso:assert test="normalize-space() != ''" diagnostics="Element2.2EmptyRecommended">Element2.2EmptyRecommended</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:lifeCycle/lom:contribute">
            <iso:assert test="lom:date/lom:dateTime or lom:date/lom:description/lom:string[normalize-space(text())='non disponible']" diagnostics="Element2.3.3UndefinedRecommended">Element2.3.3UndefinedRecommended</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:lifeCycle/lom:contribute/lom:date">
            <iso:assert test="normalize-space(lom:dateTime) != '' or normalize-space(lom:description/lom:string) != ''" diagnostics="Element2.3.3EmptyRecommended">Element2.3.3EmptyRecommended</iso:assert>
        </iso:rule>
    </iso:pattern>

    <iso:pattern id="MandatoryElements.MetaMetadata">
        <iso:title>Validating MetaMetadata category's mandatory elements</iso:title>
        <iso:rule context="lom:lom/lom:metaMetadata">
            <iso:assert test="lom:identifier" diagnostics="Element3.1UndefinedMandatory">Element3.1UndefinedMandatory</iso:assert>
            <iso:assert test="lom:metadataSchema" diagnostics="Element3.3UndefinedMandatory">Element3.3UndefinedMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:metaMetadata/lom:identifier">
            <iso:assert test="lom:catalog" diagnostics="Element3.1.1UndefinedMandatory">Element3.1.1UndefinedMandatory</iso:assert>
            <iso:assert test="lom:entry" diagnostics="Element3.1.2UndefinedMandatory">Element3.1.2UndefinedMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:metaMetadata/lom:identifier/lom:catalog">
            <iso:assert test="normalize-space() != ''" diagnostics="Element3.1.1EmptyMandatory">Element3.1.1EmptyMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:metaMetadata/lom:identifier/lom:entry">
            <iso:assert test="normalize-space() != ''" diagnostics="Element3.1.2EmptyMandatory">Element3.1.2EmptyMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:metaMetadata/lom:metadataSchema">
            <iso:assert test="normalize-space() != ''" diagnostics="Element3.3EmptyMandatory">Element3.3EmptyMandatory</iso:assert>
        </iso:rule>
    </iso:pattern>

    <!--iso:pattern id="ConditionalMandatoryElements.MetaMetadata">
        <iso:title>Validating MetaMetadata category's conditional mandatory elements</iso:title>
    </iso:pattern-->

    <!--iso:pattern id="ConditionalMandatoryElements.MetaMetadata.2">
        <iso:title>Validating MetaMetadata category's conditional mandatory elements (phase 2)</iso:title>
    </iso:pattern-->

    <!--iso:pattern id="RecommendedElements.MetaMetadata">
        <iso:title>Validating MetaMetadata category's recommended elements</iso:title>
    </iso:pattern-->

    <iso:pattern id="MandatoryElements.Technical">
        <iso:title>Validating Technical category's mandatory elements</iso:title>
        <iso:rule context="lom:lom/lom:technical">
            <iso:assert test="lom:format" diagnostics="Element4.1UndefinedMandatory">Element4.1UndefinedMandatory</iso:assert>
            <iso:assert test="lom:location" diagnostics="Element4.3UndefinedMandatory">Element4.3UndefinedMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:technical/lom:format">
            <iso:assert test="normalize-space() != ''" diagnostics="Element4.1EmptyMandatory">Element4.1EmptyMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:technical/lom:location">
            <iso:assert test="normalize-space() != ''" diagnostics="Element4.3EmptyMandatory">Element4.3EmptyMandatory</iso:assert>
        </iso:rule>
    </iso:pattern>

    <!--iso:pattern id="ConditionalMandatoryElements.Technical">
        <iso:title>Validating Technical category's conditional mandatory elements</iso:title>
    </iso:pattern-->

    <!--iso:pattern id="ConditionalMandatoryElements.Technical.2">
        <iso:title>Validating Technical category's conditional mandatory elements (phase 2)</iso:title>
    </iso:pattern-->

    <iso:pattern id="RecommendedElements.Technical">
        <iso:title>Validating Technical category's recommended elements</iso:title>
        <iso:rule context="lom:lom/lom:technical">
            <iso:assert test="lom:size" diagnostics="Element4.2UndefinedRecommended">Element4.2UndefinedRecommended</iso:assert>
            <iso:assert test="lom:installationRemarks" diagnostics="Element4.5UndefinedRecommended">Element4.5UndefinedRecommended</iso:assert>
            <iso:assert test="lom:otherPlatformRequirements" diagnostics="Element4.6UndefinedRecommended">Element4.6UndefinedRecommended</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:technical/lom:size">
            <iso:assert test="normalize-space() != ''" diagnostics="Element4.2EmptyRecommended">Element4.2EmptyRecommended</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:technical/lom:installationRemarks">
            <iso:assert test="normalize-space() != ''" diagnostics="Element4.5EmptyRecommended">Element4.5EmptyRecommended</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:technical/lom:otherPlatformRequirements">
            <iso:assert test="normalize-space() != ''" diagnostics="Element4.6EmptyRecommended">Element4.6EmptyRecommended</iso:assert>
        </iso:rule>
    </iso:pattern>

    <iso:pattern id="MandatoryElements.Educational">
        <iso:title>Validating Educational category's mandatory elements</iso:title>
        <iso:rule context="lom:lom/lom:educational">
            <iso:assert test="lom:learningResourceType" diagnostics="Element5.2UndefinedMandatory">Element5.2UndefinedMandatory</iso:assert>
            <iso:assert test="lom:context" diagnostics="Element5.6UndefinedMandatory">Element5.6UndefinedMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:educational/lom:learningResourceType">
            <iso:assert test="normalize-space() != ''" diagnostics="Element5.2EmptyMandatory">Element5.2EmptyMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:educational/lom:context">
            <iso:assert test="normalize-space() != ''" diagnostics="Element5.6EmptyMandatory">Element5.6EmptyMandatory</iso:assert>
        </iso:rule>
    </iso:pattern>

    <!--iso:pattern id="ConditionalMandatoryElements.Educational">
        <iso:title>Validating Educational category's conditional mandatory elements</iso:title>
    </iso:pattern-->

    <!--iso:pattern id="ConditionalMandatoryElements.Educational.2">
        <iso:title>Validating Educational category's conditional mandatory elements (phase 2)</iso:title>
    </iso:pattern-->

    <iso:pattern id="RecommendedElements.Educational">
        <iso:title>Validating Educational category's recommended elements</iso:title>
        <iso:rule context="lom:lom/lom:educational">
            <iso:assert test="lom:intendedEndUserRole" diagnostics="Element5.5UndefinedRecommended">Element5.5UndefinedRecommended</iso:assert>
            <iso:assert test="lom:typicalAgeRange" diagnostics="Element5.7UndefinedRecommended">Element5.7UndefinedRecommended</iso:assert>
            <iso:assert test="lom:typicalLearningTime" diagnostics="Element5.9UndefinedRecommended">Element5.9UndefinedRecommended</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:educational/lom:intendedEndUserRole">
            <iso:assert test="normalize-space() != ''" diagnostics="Element5.9EmptyRecommended">Element5.9EmptyRecommended</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:educational/lom:typicalAgeRange">
            <iso:assert test="normalize-space() != ''" diagnostics="Element5.7EmptyRecommended">Element5.7EmptyRecommended</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:educational/lom:typicalLearningTime">
            <iso:assert test="normalize-space() != ''" diagnostics="Element5.9EmptyRecommended">Element5.9EmptyRecommended</iso:assert>
        </iso:rule>
    </iso:pattern>

    <iso:pattern id="MandatoryElements.Rights">
        <iso:title>Validating Rights category's mandatory elements</iso:title>
        <iso:rule context="lom:lom/lom:rights">
            <iso:assert test="lom:cost" diagnostics="Element6.1UndefinedMandatory">Element6.1UndefinedMandatory</iso:assert>
            <iso:assert test="lom:copyrightAndOtherRestrictions" diagnostics="Element6.2UndefinedMandatory">Element6.2UndefinedMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:rights/lom:cost">
            <iso:assert test="normalize-space() != ''" diagnostics="Element6.1EmptyMandatory">Element6.1EmptyMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:rights/lom:copyrightAndOtherRestrictions">
            <iso:assert test="normalize-space() != ''" diagnostics="Element6.2EmptyMandatory">Element6.2EmptyMandatory</iso:assert>
        </iso:rule>
    </iso:pattern>

    <iso:pattern id="ConditionalMandatoryElements.Rights">
        <iso:title>Validating Rights category's conditional mandatory elements</iso:title>
        <iso:rule context="lom:lom/lom:rights">
            <iso:assert test="( lom:description and string-length( string-join( for $s in lom:description/lom:string return( normalize-space( $s ) ), '' ) ) > 0 ) or normalize-space(lom:copyrightAndOtherRestrictions/lom:value/text()) != 'yes'" diagnostics="Element6.3MandatoryBecause6.2Yes">Element6.3MandatoryBecause6.2Yes</iso:assert>
        </iso:rule>
    </iso:pattern>

    <!--iso:pattern id="ConditionalMandatoryElements.Rights.2">
        <iso:title>Validating Rights category's conditional mandatory elements (phase 2)</iso:title>
    </iso:pattern-->

    <!--iso:pattern id="RecommendedElements.Rights">
        <iso:title>Validating Rights category's recommended elements</iso:title>
    </iso:pattern-->

    <!--iso:pattern id="MandatoryElements.Relation">
        <iso:title>Validating Relation category's mandatory elements</iso:title>
    </iso:pattern-->

    <!--iso:pattern id="ConditionalMandatoryElements.Relation">
        <iso:title>Validating Relation category's conditional mandatory elements</iso:title>
    </iso:pattern-->

    <!--iso:pattern id="ConditionalMandatoryElements.Relation.2">
        <iso:title>Validating Relation category's conditional mandatory elements (phase 2)</iso:title>
    </iso:pattern-->

    <iso:pattern id="RecommendedElements.Relation">
        <iso:title>Validating Relation category's recommended elements</iso:title>
        <iso:rule context="lom:lom/lom:relation">
            <iso:assert test="lom:kind" diagnostics="Element7.1UndefinedRecommended">Element7.1UndefinedRecommended</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:relation/lom:kind">
            <iso:assert test="normalize-space() != ''" diagnostics="Element7.1EmptyRecommended">Element7.1EmptyRecommended</iso:assert>
        </iso:rule>
    </iso:pattern>

    <!--iso:pattern id="MandatoryElements.Annotation">
        <iso:title>Validating Annotation category's mandatory elements</iso:title>
    </iso:pattern-->

    <!--iso:pattern id="ConditionalMandatoryElements.Annotation">
        <iso:title>Validating Annotation category's conditional mandatory elements</iso:title>
    </iso:pattern-->

    <!--iso:pattern id="ConditionalMandatoryElements.Annotation.2">
        <iso:title>Validating Annotation category's conditional mandatory elements (phase 2)</iso:title>
    </iso:pattern-->

    <!--iso:pattern id="RecommendedElements.Annotation">
        <iso:title>Validating Annotation category's recommended elements</iso:title>
    </iso:pattern-->

    <iso:pattern id="MandatoryElements.Classification">
        <iso:title>Validating Classification category's mandatory elements</iso:title>
        <iso:rule context="lom:lom/lom:classification">
            <iso:assert test="lom:purpose" diagnostics="Element9.1UndefinedMandatory">Element9.1UndefinedMandatory</iso:assert>
            <iso:assert test="lom:taxonPath" diagnostics="Element9.2UndefinedMandatory">Element9.2UndefinedMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:classification/lom:purpose">
            <iso:assert test="normalize-space() != ''" diagnostics="Element9.1EmptyMandatory">Element9.1EmptyMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:classification/lom:taxonPath">
            <iso:assert test="lom:source" diagnostics="Element9.2.1UndefinedMandatory">Element9.2.1UndefinedMandatory</iso:assert>
            <iso:assert test="lom:taxon" diagnostics="Element9.2.2UndefinedMandatory">Element9.2.2UndefinedMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:classification/lom:taxonPath/lom:source">
            <iso:assert test="normalize-space() != ''" diagnostics="Element9.2.1EmptyMandatory">Element9.2.1EmptyMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:classification/lom:taxonPath/lom:taxon">
            <iso:assert test="lom:id" diagnostics="Element9.2.2.1UndefinedMandatory">Element9.2.2.1UndefinedMandatory</iso:assert>
            <iso:assert test="lom:entry" diagnostics="Element9.2.2.2UndefinedMandatory">Element9.2.2.2UndefinedMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:classification/lom:taxonPath/lom:taxon/lom:id">
            <iso:assert test="normalize-space() != ''" diagnostics="Element9.2.2.1EmptyMandatory">Element9.2.2.1EmptyMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:classification/lom:taxonPath/lom:taxon/lom:entry">
            <iso:assert test="normalize-space() != ''" diagnostics="Element9.2.2.2EmptyMandatory">Element9.2.2.2EmptyMandatory</iso:assert>
        </iso:rule>
    </iso:pattern>

    <!--iso:pattern id="ConditionalMandatoryElements.Classification">
        <iso:title>Validating Classification category's conditional mandatory elements</iso:title>
    </iso:pattern-->

    <!--iso:pattern id="ConditionalMandatoryElements.Classification.2">
        <iso:title>Validating Classification category's conditional mandatory elements (phase 2)</iso:title>
    </iso:pattern-->

    <!--iso:pattern id="RecommendedElements.Classification">
        <iso:title>Validating Classification category's recommended elements</iso:title>
    </iso:pattern-->

    <!-- 
        The following rules are an example of value validation.  
        They are not foolproof yet and could produce false positive warnings.
        Fine-tuning is needed to fix that.
    -->
    <iso:pattern>
        <iso:rule abstract="true" id="LanguageAttributeValidationRule">
            <iso:let name="language" value="normalize-space(current()/@language)"/>
            <!-- The pattern is not perfect but probably good enough. -->
            <iso:assert test="not($language) or matches($language, '^((i|x)-)?(\p{L}\p{L}\p{L}?)(-\p{L}\p{L})?', 'i')" diagnostics="ElementWithIllegalLangString">ElementWithIllegalLangString</iso:assert>
            <!-- Validate language code. -->
            <iso:let name="langLength" value="string-length($language)"/>
            <iso:let name="langCodeBeforeDash" value="substring-before($language,'-')"/>
            <iso:let name="langCodeLength" value="string-length($langCodeBeforeDash)"/>
            <iso:let name="countryCode" value="substring-after($language,'-')"/>
            <iso:report test="$langLength = 2 and not(document('iso_639-1.xml')//language[@code = lower-case( $language )])" diagnostics="ElementWithUnrecognizedLanguageCode">ElementWithUnrecognizedLanguageCode</iso:report>
            <iso:report test="$langLength = 3 and not(document('iso_639-2.xml')//language[@code = lower-case( $language )])" diagnostics="ElementWithUnrecognizedLanguageCode">ElementWithUnrecognizedLanguageCode</iso:report>
            <iso:report test="$langLength = 5 and $langCodeLength = 2 and not(document('iso_639-1.xml')//language[@code = lower-case( $langCodeBeforeDash )])" diagnostics="ElementWithUnrecognizedLanguageCode">ElementWithUnrecognizedLanguageCode</iso:report>
            <iso:report test="$langLength = 6 and $langCodeLength = 3 and not(document('iso_639-2.xml')//language[@code = lower-case( $langCodeBeforeDash )])" diagnostics="ElementWithUnrecognizedLanguageCode">ElementWithUnrecognizedLanguageCode</iso:report>
            <!-- Validate country code. -->
            <iso:report test="string-length($countryCode) = 2 and not(document('iso_3166-1_list_en.xml')//ISO_3166-1_Alpha-2_Code_element[text() = upper-case( $countryCode )])" diagnostics="ElementWithUnrecognizedCountryCode">ElementWithUnrecognizedCountryCode</iso:report>
            <!-- 
                The next rule provokes false positive if 'i-' prefix is used in the language attribute.  
                Needs fine-tuning or leave it commented. 
            -->
            <!--iso:report test="string-length($countryCode) > 2">Element <iso:name/> has a LangString element with an illegal language attribute.  The country code contains more than 2 characters.</iso:report-->
        </iso:rule>
    </iso:pattern>

    
    <!-- 
        The following patterns validate vocabularies values.
        It's an example illustrating how to do it in Schematron.
        This method could be more user-friendly than XSD or RelaxNG as
        we can customize the error messages.

        For the moment, only elements with vocabulary values particular
        to Normetic profile have been implemented.  Other vocabulary elements
        are supposed to be processed by the XSD.
    -->
    <!--iso:pattern id="Vocabularies.General">
    </iso:pattern-->

    <!--iso:pattern id="Vocabularies.LifeCycle">
    </iso:pattern-->

    <!--iso:pattern id="Vocabularies.MetaMetadata">
    </iso:pattern-->

    <!--iso:pattern id="Vocabularies.Technical">
    </iso:pattern-->

    <iso:pattern id="Vocabularies.Educational">
        <iso:rule context="lom:lom/lom:educational/lom:learningResourceType">
            <iso:let name="source" value="normalize-space(lom:source/text())"/>
            <iso:let name="value" value="normalize-space(current()/lom:value/text())"/>
            <iso:assert test="$source = 'LOMv1.0' or $source = 'http://www.normetic.org/vdex/typeressourcev1_2.xml'" diagnostics="UnrecognizedVocabularySourceForElement5.2">UnrecognizedVocabularySourceForElement5.2</iso:assert>
            <iso:report test="$source = 'LOMv1.0' and not(document('typeressourcev1_2.xml')//vdx:termIdentifier[normalize-space(text()) = $value])" diagnostics="InvalidVocabularyForElement5.2">InvalidVocabularyForElement5.2</iso:report>
            <iso:report test="$source = 'http://www.normetic.org/vdex/typeressourcev1_2.xml' and not(document('typeressourcev1_2.xml')//vdx:termIdentifier[normalize-space(text()) = $value])" diagnostics="InvalidVocabularyForElement5.2">InvalidVocabularyForElement5.2</iso:report>
        </iso:rule>

        <iso:rule context="lom:lom/lom:educational/lom:context">
            <iso:let name="source" value="normalize-space(lom:source/text())"/>
            <iso:let name="value" value="normalize-space(current()/lom:value/text())"/>
            <iso:assert test="$source = 'LOMv1.0' or $source = 'http://eureka.ntic.org/vdex/NORMETICv1.0_element_5_6_contexte_voc.xml'" diagnostics="UnrecognizedVocabularySourceForElement5.6">UnrecognizedVocabularySourceForElement5.6</iso:assert>
            <iso:report test="$source = 'LOMv1.0' and not(document('LOMv1.0_element_5_6_context_voc.xml')//vdx:termIdentifier[normalize-space(text()) = $value])" diagnostics="InvalidVocabularyForElement5.6">InvalidVocabularyForElement5.6</iso:report>
            <iso:report test="$source = 'http://eureka.ntic.org/vdex/NORMETICv1.0_element_5_6_contexte_voc.xml' and not(document('NORMETICv1.0_element_5_6_contexte_voc.xml')//vdx:termIdentifier[normalize-space(text()) = $value])" diagnostics="InvalidVocabularyForElement5.6">InvalidVocabularyForElement5.6</iso:report>
        </iso:rule>
    </iso:pattern>

    <!--iso:pattern id="Vocabularies.Rights">
    </iso:pattern-->

    <!--iso:pattern id="Vocabularies.Relation">
    </iso:pattern-->

    <!--iso:pattern id="Vocabularies.Annotation">
    </iso:pattern-->

    <!--iso:pattern id="Vocabularies.Classification">
    </iso:pattern-->

    <iso:pattern id="LanguageAttributes.General">
        <iso:rule context="lom:lom/lom:general/lom:title/lom:string">
            <iso:extends rule="LanguageAttributeValidationRule"/>
        </iso:rule>
        <iso:rule context="lom:lom/lom:general/lom:description/lom:string">
            <iso:extends rule="LanguageAttributeValidationRule"/>
        </iso:rule>
        <iso:rule context="lom:lom/lom:general/lom:keyword/lom:string">
            <iso:extends rule="LanguageAttributeValidationRule"/>
        </iso:rule>
        <iso:rule context="lom:lom/lom:general/lom:coverage/lom:string">
            <iso:extends rule="LanguageAttributeValidationRule"/>
        </iso:rule>
    </iso:pattern>

    <iso:pattern id="LanguageAttributes.LifeCycle">
        <iso:rule context="lom:lom/lom:lifeCycle/lom:version/lom:string">
            <iso:extends rule="LanguageAttributeValidationRule"/>
        </iso:rule>
    </iso:pattern>

    <!--iso:pattern id="LanguageAttributes.MetaMetadata">
    </iso:pattern-->

    <iso:pattern id="LanguageAttributes.Technical">
        <iso:rule context="lom:lom/lom:technical/lom:installationRemarks/lom:string">
            <iso:extends rule="LanguageAttributeValidationRule"/>
        </iso:rule>
        <iso:rule context="lom:lom/lom:technical/lom:otherPlatformRequirements/lom:string">
            <iso:extends rule="LanguageAttributeValidationRule"/>
        </iso:rule>
    </iso:pattern>

    <iso:pattern id="LanguageAttributes.Educational">
        <iso:rule context="lom:lom/lom:educational/lom:typicalAgeRange/lom:string">
            <iso:extends rule="LanguageAttributeValidationRule"/>
        </iso:rule>
        <iso:rule context="lom:lom/lom:educational/lom:description/lom:string">
            <iso:extends rule="LanguageAttributeValidationRule"/>
        </iso:rule>
    </iso:pattern>

    <iso:pattern id="LanguageAttributes.Rights">
        <iso:rule context="lom:lom/lom:rights/lom:description/lom:string">
            <iso:extends rule="LanguageAttributeValidationRule"/>
        </iso:rule>
    </iso:pattern>

    <iso:pattern id="LanguageAttributes.Relation">
        <iso:rule context="lom:lom/lom:relation/lom:description/lom:string">
            <iso:extends rule="LanguageAttributeValidationRule"/>
        </iso:rule>
    </iso:pattern>

    <iso:pattern id="LanguageAttributes.Annotation">
        <iso:rule context="lom:lom/lom:annotation/lom:description/lom:string">
            <iso:extends rule="LanguageAttributeValidationRule"/>
        </iso:rule>
    </iso:pattern>

    <iso:pattern id="LanguageAttributes.Classification">
        <iso:rule context="lom:lom/lom:classification/lom:taxonPath/lom:source/lom:string">
            <iso:extends rule="LanguageAttributeValidationRule"/>
        </iso:rule>
        <iso:rule context="lom:lom/lom:classification/lom:taxonPath/lom:taxon/lom:entry/lom:string">
            <iso:extends rule="LanguageAttributeValidationRule"/>
        </iso:rule>
        <iso:rule context="lom:lom/lom:classification/lom:description/lom:string">
            <iso:extends rule="LanguageAttributeValidationRule"/>
        </iso:rule>
        <iso:rule context="lom:lom/lom:classification/lom:keyword/lom:string">
            <iso:extends rule="LanguageAttributeValidationRule"/>
        </iso:rule>
    </iso:pattern>

    <!--iso:include href="diagnostics.inc"/-->
    <iso:diagnostics>
        <!-- Mandatory Categories -->
        <iso:diagnostic id="GeneralCategoryMandatory" xml:lang="en">Category 1-General is not defined.  This category is mandatory.</iso:diagnostic>  
        <iso:diagnostic id="LifeCycleCategoryMandatory" xml:lang="en">Category 2-LifeCycle is not defined.  This category is mandatory.</iso:diagnostic>
        <iso:diagnostic id="MetaMetaDataCategoryMandatory" xml:lang="en">Category 3-MetaMetadata is not defined.  This category is mandatory.</iso:diagnostic>
        <iso:diagnostic id="TechnicalCategoryMandatory" xml:lang="en">Category 4-Technical is not defined.  This category is mandatory.</iso:diagnostic>
        <iso:diagnostic id="EducationalCategoryMandatory" xml:lang="en">Category 5-Educational is not defined.  This category is mandatory.</iso:diagnostic>
        <iso:diagnostic id="RightsCategoryMandatory" xml:lang="en">Category 6-Rights is not defined.  This category is mandatory.</iso:diagnostic>
        <iso:diagnostic id="ClassificationCategoryMandatory" xml:lang="en">Category 9-Classification is not defined.  This category is mandatory.</iso:diagnostic> 

        <!-- Mandatory Elements (General) -->
        <iso:diagnostic id="Element1.2UndefinedMandatory" xml:lang="en">Element 1.2-Title is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element1.3UndefinedMandatory" xml:lang="en">Element 1.3-Language is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element1.4UndefinedMandatory" xml:lang="en">Element 1.4-Description is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element1.2EmptyMandatory" xml:lang="en">Element 1.2-Title is empty.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element1.3EmptyMandatory" xml:lang="en">Element 1.3-Language is empty.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element1.4EmptyMandatory" xml:lang="en">Element 1.4-Description is empty.  This element is mandatory.</iso:diagnostic>

        <!-- Conditional Mandatory Elements (General) -->
        <iso:diagnostic id="Element1.5UndefinedOrEmptyPhase2Required" xml:lang="en">Element 1.5-Keyword is not defined or is empty.  *** VALIDATION PHASE 2 REQUIRED ***</iso:diagnostic>
        <iso:diagnostic id="Element1.5UndefinedOrEmptyMandatory" xml:lang="en">Element 1.5-Keyword is not defined or is empty.  As no classification with purpose 'discipline' or 'idea' are defined, this element is mandatory.</iso:diagnostic>

        <!-- Recommended Categories -->
        <iso:diagnostic id="RelationCategoryRecommended" xml:lang="en">Category 7-Relation is not defined.  This category is recommended.</iso:diagnostic>  

        <!-- Recommended Elements (General) -->
        <iso:diagnostic id="Element1.1UndefinedRecommended" xml:lang="en">Element 1.1-Identifier is not defined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="Element1.1.1UndefinedRecommended" xml:lang="en">Element 1.1.1-Catalog is not defined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="Element1.1.2UndefinedRecommended" xml:lang="en">Element 1.1.2-Entry is not defined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="Element1.1.1EmptyRecommended" xml:lang="en">Element 1.1.1-Catalog is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="Element1.1.2EmptyRecommended" xml:lang="en">Element 1.1.2-Entry is empty.  This element is recommended.</iso:diagnostic>

        <!-- Mandatory Elements (LifeCycle) -->
        <iso:diagnostic id="Element2.1UndefinedMandatory" xml:lang="en">Element 2.1-Version is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element2.3UndefinedMandatory" xml:lang="en">Element 2.3-Contribute is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element2.1EmptyMandatory" xml:lang="en">Element 2.1-Version is empty.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element2.3.1UndefinedMandatory" xml:lang="en">Element 2.3.1-Role is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element2.3.2UndefinedMandatory" xml:lang="en">Element 2.3.2-Entity is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element2.3.1EmptyMandatory" xml:lang="en">Element 2.3.1-Role is empty.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element2.3.2EmptyMandatory" xml:lang="en">Element 2.3.2-Entity is empty.  This element is mandatory.</iso:diagnostic>

        <!-- Conditional Mandatory Elements (LifeCycle) -->
        <iso:diagnostic id="Element2.3.3UndefinedMandatory" xml:lang="en">Element 2.3.3-Date is not defined.  This element is mandatory for at least one contributor.  In case you don't know the date of contribution, please enter 'non disponible' in the description field.</iso:diagnostic>

        <!-- Recommended Elements (LifeCycle) -->
        <iso:diagnostic id="Element2.2UndefinedRecommended" xml:lang="en">Element 2.2-Status is not defined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="Element2.2EmptyRecommended" xml:lang="en">Element 2.2-Status is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="Element2.3.3UndefinedRecommended" xml:lang="en">Element 2.3.3-Date is not defined.  This element is recommended.  In case you don't know the date of contribution, please enter 'non disponible' in the description field.</iso:diagnostic>
        <iso:diagnostic id="Element2.3.3EmptyRecommended" xml:lang="en">Element 2.3.3-Date is empty.  This element is recommended.  In case you don't know the date of contribution, please enter 'non disponible' in the description field.</iso:diagnostic>

        <!-- Mandatory Elements (MetaMetadata) -->
        <iso:diagnostic id="Element3.1UndefinedMandatory" xml:lang="en">Element 3.1-Identifier is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element3.3UndefinedMandatory" xml:lang="en">Element 3.3-MetadataSchema is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element3.1.1UndefinedMandatory" xml:lang="en">Element 3.1.1-Catalog is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element3.1.2UndefinedMandatory" xml:lang="en">Element 3.1.2-Entry is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element3.1.1EmptyMandatory" xml:lang="en">Element 3.1.1-Catalog is empty.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element3.1.2EmptyMandatory" xml:lang="en">Element 3.1.2-Entry is empty.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element3.3EmptyMandatory" xml:lang="en">Element 3.3-MetadataSchema is empty.  This element is mandatory.</iso:diagnostic>

        <!-- Mandatotry Elements (Technical) -->
        <iso:diagnostic id="Element4.1UndefinedMandatory" xml:lang="en">Element 4.1-Format is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element4.3UndefinedMandatory" xml:lang="en">Element 4.3-Location is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element4.1EmptyMandatory" xml:lang="en">Element 4.1-Format is empty.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element4.3EmptyMandatory" xml:lang="en">Element 4.3-Location is empty.  This element is mandatory.</iso:diagnostic>

        <!-- Recommended Elements (Technical) --> 
        <iso:diagnostic id="Element4.2UndefinedRecommended" xml:lang="en">Element 4.2-Size is not defined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="Element4.5UndefinedRecommended" xml:lang="en">Element 4.5-InstallationRemarks is not defined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="Element4.6UndefinedRecommended" xml:lang="en">Element 4.6-OtherPlatformRequirements is not defined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="Element4.2EmptyRecommended" xml:lang="en">Element 4.2-Size is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="Element4.5EmptyRecommended" xml:lang="en">Element 4.5-InstallationRemarks is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="Element4.6EmptyRecommended" xml:lang="en">Element 4.6-OtherPlatformRequirements is empty.  This element is recommended.</iso:diagnostic>

        <!-- Mandatory Elements (Educational) -->
        <iso:diagnostic id="Element5.2UndefinedMandatory" xml:lang="en">Element 5.2-LearningResourceType is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element5.6UndefinedMandatory" xml:lang="en">Element 5.6-Context is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element5.2EmptyMandatory" xml:lang="en">Element 5.2-LearningResourceType is empty.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element5.6EmptyMandatory" xml:lang="en">Element 5.6-Context is empty.  This element is mandatory.</iso:diagnostic>

        <!-- Recommended Elements (Educational) --> 
        <iso:diagnostic id="Element5.5UndefinedRecommended" xml:lang="en">Element 5.5-IntendedEndUserRole is not defined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="Element5.7UndefinedRecommended" xml:lang="en">Element 5.7-TypicalAgeRange is not defined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="Element5.9UndefinedRecommended" xml:lang="en">Element 5.9-TypicalLearningTime is not defined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="Element5.9EmptyRecommended" xml:lang="en">Element 5.5-IntendedEndUserRole is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="Element5.7EmptyRecommended" xml:lang="en">Element 5.7-TypicalAgeRange is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="Element5.9EmptyRecommended" xml:lang="en">Element 5.9-TypicalLearningTime is empty.  This element is recommended.</iso:diagnostic>

        <!-- Recommended Elements (Educational) --> 
        <iso:diagnostic id="Element7.1UndefinedRecommended" xml:lang="en">Element 7.1-Type is not defined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="Element7.1EmptyRecommended" xml:lang="en">Element 7.1-Type is empty.  This element is recommended.</iso:diagnostic>

        <!-- Mandatory Elements (Rights) --> 
        <iso:diagnostic id="Element6.1UndefinedMandatory" xml:lang="en">Element 6.1-Cost is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element6.2UndefinedMandatory" xml:lang="en">Element 6.2-CopyrightAndOtherRestrictions is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element6.1EmptyMandatory" xml:lang="en">Element 6.1-Cost is empty.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element6.2EmptyMandatory" xml:lang="en">Element 6.2-CopyrightAndOtherRestrictions is empty.  This element is mandatory.</iso:diagnostic>

        <!-- Conditional Mandatory Elements (Rights) -->
        <iso:diagnostic id="Element6.3MandatoryBecause6.2Yes" xml:lang="en">As element 6.2-CopyrightAndOtherRestrictions's value is 'yes', the element 6.3-Description is mandatory.</iso:diagnostic>

        <!-- Mandatory Elements (Classification) --> 
        <iso:diagnostic id="Element9.1UndefinedMandatory" xml:lang="en">Element 9.1-Purpose is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element9.2UndefinedMandatory" xml:lang="en">Element 9.2-TaxonPath is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element9.1EmptyMandatory" xml:lang="en">Element 9.1-Purpose is empty.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element9.2.1UndefinedMandatory" xml:lang="en">Element 9.2.1-Source is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element9.2.2UndefinedMandatory" xml:lang="en">Element 9.2.2-Taxon is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element9.2.1EmptyMandatory" xml:lang="en">Element 9.2.1-Source is empty.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element9.2.2.1UndefinedMandatory" xml:lang="en">Element 9.2.2.1-Id is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element9.2.2.2UndefinedMandatory" xml:lang="en">Element 9.2.2.2-Entry is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element9.2.2.1EmptyMandatory" xml:lang="en">Element 9.2.2.1-Id is empty.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element9.2.2.2EmptyMandatory" xml:lang="en">Element 9.2.2.2-Entry is empty.  This element is mandatory.</iso:diagnostic>

        <!-- Language Attributes --> 
        <iso:diagnostic id="ElementWithIllegalLangString" xml:lang="en">Element <iso:name/> has a LangString element with an illegal language attribute.</iso:diagnostic>
        <iso:diagnostic id="ElementWithUnrecognizedLanguageCode" xml:lang="en">Element <iso:name/> has a LangString element with an illegal language attribute.  The language code is not recognized.</iso:diagnostic>
        <iso:diagnostic id="ElementWithUnrecognizedCountryCode" xml:lang="en">Element <iso:name/> has a LangString element with an illegal language attribute.  The country code is not recognized.</iso:diagnostic>

        <!-- Vocabularies (Educational) -->
        <iso:diagnostic id="UnrecognizedVocabularySourceForElement5.2" xml:lang="en">Unrecognized source for element 5.2-LearningResourceType.</iso:diagnostic>
        <iso:diagnostic id="InvalidVocabularyForElement5.2" xml:lang="en">Invalid vocabulary definition for element 5.2-LearningResourceType.</iso:diagnostic>
        <iso:diagnostic id="UnrecognizedVocabularySourceForElement5.6" xml:lang="en">Unrecognized source for element 5.6-Context.</iso:diagnostic>
        <iso:diagnostic id="InvalidVocabularyForElement5.6" xml:lang="en">Invalid vocabulary definition for element 5.6-Context.</iso:diagnostic>
    </iso:diagnostics>

</iso:schema>
