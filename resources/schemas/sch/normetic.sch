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
        <iso:active pattern="RecommendedElements.MetaMetadata"/>
        <iso:active pattern="RecommendedElements.Technical"/>
        <iso:active pattern="RecommendedElements.Educational"/>
        <!--iso:active pattern="RecommendedElements.Rights"/-->
        <iso:active pattern="RecommendedElements.Relation"/>
        <iso:active pattern="RecommendedElements.Annotation"/>
        <iso:active pattern="RecommendedElements.Classification"/>
    </iso:phase>

    <iso:phase id="RecommendedAttributes">
        <iso:active pattern="RecommendedAttributes.General"/>
        <iso:active pattern="RecommendedAttributes.LifeCycle"/>
        <iso:active pattern="RecommendedAttributes.MetaMetadata"/>
        <iso:active pattern="RecommendedAttributes.Technical"/>
        <iso:active pattern="RecommendedAttributes.Educational"/>
        <iso:active pattern="RecommendedAttributes.Rights"/>
        <iso:active pattern="RecommendedAttributes.Relation"/>
        <iso:active pattern="RecommendedAttributes.Annotation"/>
        <iso:active pattern="RecommendedAttributes.Classification"/>
    </iso:phase>

    <iso:pattern id="RecommendedAttributes.General">
        <iso:title>Validating General category's recommended attributes</iso:title>
        <iso:rule context="lom:lom/lom:general/lom:title/lom:string">
            <iso:assert test="@language" diagnostics="P1Language-1.2_Attribute1.2LanguageUndefinedRecommended">P1Language-1.2_Attribute1.2LanguageUndefinedRecommended</iso:assert>
            <!--iso:report test="@language and normalize-space(current()/@language) = ''" diagnostics="P2Language-1.2_Attribute1.2LanguageEmptyRecommended">P2Language-1.2_Attribute1.2LanguageEmptyRecommended</iso:report-->
        </iso:rule>
        <iso:rule context="lom:lom/lom:general/lom:description/lom:string">
            <iso:assert test="@language" diagnostics="P1-1.4_Attribute1.4LanguageUndefinedRecommended">P1-1.4_Attribute1.4LanguageUndefinedRecommended</iso:assert>
            <!--iso:report test="@language and normalize-space(@language) = ''" diagnostics="P2-1.4_Attribute1.4LanguageEmptyRecommended">P2-1.4_Attribute1.4LanguageEmptyRecommended</iso:report-->
        </iso:rule>
        <iso:rule context="lom:lom/lom:general/lom:keyword/lom:string">
            <iso:assert test="@language" diagnostics="P1-1.5_Attribute1.5LanguageUndefinedRecommended">P1-1.5_Attribute1.5LanguageUndefinedRecommended</iso:assert>
            <!--iso:report test="@language and normalize-space(@language) = ''" diagnostics="P2-1.5_Attribute1.5LanguageEmptyRecommended">P2-1.5_Attribute1.5LanguageEmptyRecommended</iso:report-->
        </iso:rule>
        <iso:rule context="lom:lom/lom:general/lom:coverage/lom:string">
            <iso:assert test="@language" diagnostics="P1-1.6_Attribute1.6LanguageUndefinedRecommended">P1-1.6_Attribute1.6LanguageUndefinedRecommended</iso:assert>
            <!--iso:report test="@language and normalize-space(@language) = ''" diagnostics="P2-1.6_Attribute1.6LanguageEmptyRecommended">P2-1.6_Attribute1.6LanguageEmptyRecommended</iso:report-->
        </iso:rule>
        <iso:rule context="lom:lom/lom:general/lom:coverage/lom:string">
            <iso:assert test="@source" diagnostics="E1Source-1.7_Element1.7UndefinedSourceRecommended">E1Source-1.7_Element1.7UndefinedSourceRecommended</iso:assert>
            <!--iso:report test="@source and normalize-space(@source) = ''" diagnostics="P2Source-1.7_Element1.7EmptySourceRecommended">P2Source-1.7_Element1.7EmptySourceRecommended</iso:report-->
        </iso:rule>
    </iso:pattern>

    <iso:pattern id="RecommendedAttributes.LifeCycle">
        <iso:title>Validating LifeCycle category's recommended attributes</iso:title>
        <iso:rule context="lom:lom/lom:lifeCycle/lom:version/lom:string">
            <iso:assert test="@language" diagnostics="P1-2.1_Attribute2.1LanguageUndefinedRecommended">P1-2.1_Attribute2.1LanguageUndefinedRecommended</iso:assert>
            <iso:report test="@language and normalize-space(current()/@language) = ''" diagnostics="P2-2.1_Attribute2.1LanguageEmptyRecommended">P2-2.1_Attribute2.1LanguageEmptyRecommended</iso:report>
        </iso:rule>
        <iso:rule context="lom:lom/lom:lifeCycle/lom:contribute/lom:date/lom:description/lom:string">
            <iso:assert test="@language" diagnostics="P1-2.3.3_Attribute2.3.3DateDescriptionLanguageUndefinedRecommended">P1-2.3.3_Attribute2.3.3DateDescriptionLanguageUndefinedRecommended</iso:assert>
            <iso:report test="@language and normalize-space(current()/@language) = ''" diagnostics="P2-2.3.3_Attribute2.3.3DateDescriptionLanguageEmptyRecommended">P2-2.3.3_Attribute2.3.3DateDescriptionLanguageEmptyRecommended</iso:report>
        </iso:rule>
    </iso:pattern>

    <iso:pattern id="RecommendedAttributes.MetaMetadata">
        <iso:title>Validating MetaMetadata category's recommended attributes</iso:title>
        <iso:rule context="lom:lom/lom:metaMetadata/lom:contribute/lom:date/lom:description/lom:string">
            <iso:assert test="@language" diagnostics="P1-3.2.3_Attribute3.2.3DateDescriptionLanguageUndefinedRecommended">P1-3.2.3_Attribute3.2.3DateDescriptionLanguageUndefinedRecommended</iso:assert>
            <iso:report test="@language and normalize-space(current()/@language) = ''" diagnostics="P2-3.2.3_Attribute3.2.3DateDescriptionLanguageEmptyRecommended">P2-3.2.3_Attribute3.2.3DateDescriptionLanguageEmptyRecommended</iso:report>
        </iso:rule>
    </iso:pattern>

    <iso:pattern id="RecommendedAttributes.Technical">
        <iso:title>Validating Technical category's recommended attributes</iso:title>
        <iso:rule context="lom:lom/lom:technical/lom:installationRemarks/lom:string">
            <iso:assert test="@language" diagnostics="P1-4.5_Attribute4.5LanguageUndefinedRecommended">P1-4.5_Attribute4.5LanguageUndefinedRecommended</iso:assert>
            <iso:report test="@language and normalize-space(current()/@language) = ''" diagnostics="P2-4.5_Attribute4.5LanguageEmptyRecommended">P2-4.5_Attribute4.5LanguageEmptyRecommended</iso:report>
        </iso:rule>
        <iso:rule context="lom:lom/lom:technical/lom:otherPlatformRequirements/lom:string">
            <iso:assert test="@language" diagnostics="P1-4.6_Attribute4.6LanguageUndefinedRecommended">P1-4.6_Attribute4.6LanguageUndefinedRecommended</iso:assert>
            <iso:report test="@language and normalize-space(current()/@language) = ''" diagnostics="P2-4.6_Attribute4.6LanguageEmptyRecommended">P2-4.6_Attribute4.6LanguageEmptyRecommended</iso:report>
        </iso:rule>
        <iso:rule context="lom:lom/lom:technical/lom:duration/lom:description/lom:string">
            <iso:assert test="@language" diagnostics="P1-4.7_Attribute4.7LanguageUndefinedRecommended">P1-4.7_Attribute4.7LanguageUndefinedRecommended</iso:assert>
            <iso:report test="@language and normalize-space(current()/@language) = ''" diagnostics="P2-4.7_Attribute4.7LanguageEmptyRecommended">P2-4.7_Attribute4.7LanguageEmptyRecommended</iso:report>
        </iso:rule>
    </iso:pattern>

    <iso:pattern id="RecommendedAttributes.Educational">
        <iso:title>Validating Educational category's recommended attributes</iso:title>
        <iso:rule context="lom:lom/lom:educational/lom:typicalAgeRange/lom:string">
            <iso:assert test="@language" diagnostics="P1-5.7_Attribute5.7LanguageUndefinedRecommended">P1-5.7_Attribute5.7LanguageUndefinedRecommended</iso:assert>
            <iso:report test="@language and normalize-space(current()/@language) = ''" diagnostics="P2-5.7_Attribute5.7LanguageEmptyRecommended">P2-5.7_Attribute5.7LanguageEmptyRecommended</iso:report>
        </iso:rule>
        <iso:rule context="lom:lom/lom:educational/lom:typicalLearningTime/lom:description/lom:string">
            <iso:assert test="@language" diagnostics="P1-5.9_Attribute5.9LanguageUndefinedRecommended">P1-5.9_Attribute5.9LanguageUndefinedRecommended</iso:assert>
            <iso:report test="@language and normalize-space(current()/@language) = ''" diagnostics="P2-5.9_Attribute5.9LanguageEmptyRecommended">P2-5.9_Attribute5.9LanguageEmptyRecommended</iso:report>
        </iso:rule>
        <iso:rule context="lom:lom/lom:educational/lom:description/lom:string">
            <iso:assert test="@language" diagnostics="P1-5.10_Attribute5.10LanguageUndefinedRecommended">P1-5.10_Attribute5.10LanguageUndefinedRecommended</iso:assert>
            <iso:report test="@language and normalize-space(current()/@language) = ''" diagnostics="P2-5.10_Attribute5.10LanguageEmptyRecommended">P2-5.10_Attribute5.10LanguageEmptyRecommended</iso:report>
        </iso:rule>
    </iso:pattern>

    <iso:pattern id="RecommendedAttributes.Rights">
        <iso:title>Validating Rights category's recommended attributes</iso:title>
        <iso:rule context="lom:lom/lom:rights/lom:description/lom:string">
            <iso:assert test="@language" diagnostics="P1-6.3_Attribute6.3LanguageUndefinedRecommended">P1-6.3_Attribute6.3LanguageUndefinedRecommended</iso:assert>
            <iso:report test="@language and normalize-space(current()/@language) = ''" diagnostics="P2-6.3_Attribute6.3LanguageEmptyRecommended">P2-6.3_Attribute6.3LanguageEmptyRecommended</iso:report>
        </iso:rule>
    </iso:pattern>

    <iso:pattern id="RecommendedAttributes.Relation">
        <iso:title>Validating Relation category's recommended attributes</iso:title>
        <iso:rule context="lom:lom/lom:relation/lom:resource/lom:description/lom:string">
            <iso:assert test="@language" diagnostics="P1-7.2.2_Attribute7.2.2LanguageUndefinedRecommended">P1-7.2.2_Attribute7.2.2LanguageUndefinedRecommended</iso:assert>
            <iso:report test="@language and normalize-space(current()/@language) = ''" diagnostics="P2-7.2.2_Attribute7.2.2LanguageEmptyRecommended">P2-7.2.2_Attribute7.2.2LanguageEmptyRecommended</iso:report>
        </iso:rule>
    </iso:pattern>

    <iso:pattern id="RecommendedAttributes.Annotation">
        <iso:title>Validating Annotation category's recommended attributes</iso:title>
        <iso:rule context="lom:lom/lom:annotation/lom:date/lom:description/lom:string">
            <iso:assert test="@language" diagnostics="P1-8.2_Attribute8.2LanguageUndefinedRecommended">P1-8.2_Attribute8.2LanguageUndefinedRecommended</iso:assert>
            <iso:report test="@language and normalize-space(current()/@language) = ''" diagnostics="P2-8.2_Attribute8.2LanguageEmptyRecommended">P2-8.2_Attribute8.2LanguageEmptyRecommended</iso:report>
        </iso:rule>
        <iso:rule context="lom:lom/lom:annotation/lom:description/lom:string">
            <iso:assert test="@language" diagnostics="P1-8.3_Attribute8.3LanguageUndefinedRecommended">P1-8.3_Attribute8.3LanguageUndefinedRecommended</iso:assert>
            <iso:report test="@language and normalize-space(current()/@language) = ''" diagnostics="P2-8.3_Attribute8.3LanguageEmptyRecommended">P2-8.3_Attribute8.3LanguageEmptyRecommended</iso:report>
        </iso:rule>
    </iso:pattern>

    <iso:pattern id="RecommendedAttributes.Classification">
        <iso:title>Validating Classification category's recommended attributes</iso:title>
        <iso:rule context="lom:lom/lom:classification/lom:taxonPath/lom:source/lom:string">
            <iso:assert test="@language" diagnostics="P1-9.2.1_Attribute9.2.1LanguageUndefinedRecommended">P1-9.2.1_Attribute9.2.1LanguageUndefinedRecommended</iso:assert>
            <iso:report test="@language and normalize-space(current()/@language) = ''" diagnostics="P2-9.2.1_Attribute9.2.1LanguageEmptyRecommended">P2-9.2.1_Attribute9.2.1LanguageEmptyRecommended</iso:report>
        </iso:rule>
        <iso:rule context="lom:lom/lom:classification/lom:taxonPath/lom:taxon/lom:entry/lom:string">
            <iso:assert test="@language" diagnostics="P1-9.2.2.2_Attribute9.2.2.2LanguageUndefinedRecommended">P1-9.2.2.2_Attribute9.2.2.2LanguageUndefinedRecommended</iso:assert>
            <iso:report test="@language and normalize-space(current()/@language) = ''" diagnostics="P2-9.2.2.2_Attribute9.2.2.2LanguageEmptyRecommended">P2-9.2.2.2_Attribute9.2.2.2LanguageEmptyRecommended</iso:report>
        </iso:rule>
        <iso:rule context="lom:lom/lom:classification/lom:description/lom:string">
            <iso:assert test="@language" diagnostics="P1-9.3_Attribute9.3LanguageUndefinedRecommended">P1-9.3_Attribute9.3LanguageUndefinedRecommended</iso:assert>
            <iso:report test="@language and normalize-space(current()/@language) = ''" diagnostics="P2-9.3_Attribute9.3LanguageEmptyRecommended">P2-9.3_Attribute9.3LanguageEmptyRecommended</iso:report>
        </iso:rule>
        <iso:rule context="lom:lom/lom:classification/lom:keyword/lom:string">
            <iso:assert test="@language" diagnostics="P1-9.4_Attribute9.4LanguageUndefinedRecommended">P1-9.4_Attribute9.4LanguageUndefinedRecommended</iso:assert>
            <iso:report test="@language and normalize-space(current()/@language) = ''" diagnostics="P2-9.4_Attribute9.4LanguageEmptyRecommended">P2-9.4_Attribute9.4LanguageEmptyRecommended</iso:report>
        </iso:rule>
    </iso:pattern>

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
            <iso:assert test="lom:general" diagnostics="C1-1_GeneralCategoryMandatory">C1-1_GeneralCategoryMandatory</iso:assert>
            <iso:assert test="lom:lifeCycle" diagnostics="C1-2_LifeCycleCategoryMandatory">C1-2_LifeCycleCategoryMandatory</iso:assert>
            <iso:assert test="lom:metaMetadata" diagnostics="C1-3_MetaMetaDataCategoryMandatory">C1-3_MetaMetaDataCategoryMandatory</iso:assert>
            <iso:assert test="lom:technical" diagnostics="C1-4_TechnicalCategoryMandatory">C1-4_TechnicalCategoryMandatory</iso:assert>
            <iso:assert test="lom:educational" diagnostics="C1-5_EducationalCategoryMandatory">C1-5_EducationalCategoryMandatory</iso:assert>
            <iso:assert test="lom:rights" diagnostics="C1-6_RightsCategoryMandatory">C1-6_RightsCategoryMandatory</iso:assert>
            <iso:assert test="lom:classification" diagnostics="C1-9_ClassificationCategoryMandatory">C1-9_ClassificationCategoryMandatory</iso:assert>
        </iso:rule>
    </iso:pattern>

    <iso:pattern id="MandatoryElements.General">
        <iso:title>Validating General category's mandatory elements</iso:title>
        <iso:rule context="lom:lom/lom:general">
            <iso:assert test="lom:title" diagnostics="E1-1.2_Element1.1.2EmptyRecommended">E1-1.2_Element1.2UndefinedMandatory</iso:assert>
            <iso:assert test="lom:language" diagnostics="E1-1.3_Element1.3UndefinedMandatory">E1-1.3_Element1.3UndefinedMandatory</iso:assert>
            <iso:assert test="lom:description" diagnostics="E1-1.4_Element1.4UndefinedMandatory">E1-1.4_Element1.4UndefinedMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:general/lom:title">
            <iso:assert test="normalize-space() != ''" diagnostics="E2-1.2_Element1.2EmptyMandatory">E2-1.2_Element1.2EmptyMandatory</iso:assert>
        </iso:rule>
        <!--iso:rule context="lom:lom/lom:general/lom:language">
            <iso:assert test="normalize-space() != ''" diagnostics="E2-1.3_Element1.3EmptyMandatory">E2-1.3_Element1.3EmptyMandatory</iso:assert>
        </iso:rule-->
        <iso:rule context="lom:lom/lom:general/lom:description">
            <iso:assert test="normalize-space() != ''" diagnostics="E2-1.4_Element1.4EmptyMandatory">E2-1.4_Element1.4EmptyMandatory</iso:assert>
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
            <iso:assert test="normalize-space() != ''" diagnostics="SE2-1.1.1_Element1.1.1EmptyRecommended">SE2-1.1.1_Element1.1.1EmptyRecommended</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:general/lom:identifier/lom:entry">
            <iso:assert test="normalize-space() != ''" diagnostics="SE2-1.1.2_Element1.1.2EmptyRecommended">SE2-1.1.2_Element1.1.2EmptyRecommended</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:general/lom:coverage">
            <iso:assert test="normalize-space() != ''" diagnostics="E2-1.6_Element1.6EmptyRecommended">E2-1.6_Element1.6EmptyRecommended</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:general/lom:structure">
            <iso:assert test="normalize-space() != ''" diagnostics="E2-1.7_Element1.7EmptyRecommended">E2-1.7_Element1.7EmptyRecommended</iso:assert>
            <iso:report test="normalize-space() != '' and not(lom:source)" diagnostics="E1Source-1.7_Element1.7UndefinedSourceRecommended">E1Source-1.7_Element1.7UndefinedSourceRecommended</iso:report>
            <!--iso:report test="normalize-space() != '' and lom:source and normalize-space(lom:source) = ''" diagnostics="P2Source-1.7_Element1.7EmptySourceRecommended">P2Source-1.7_Element1.7EmptySourceRecommended</iso:report-->
            <iso:report test="normalize-space() != '' and not(lom:value)" diagnostics="E1Value-1.7_Element1.7UndefinedValueRecommended">E1Value-1.7_Element1.7UndefinedValueRecommended</iso:report>
            <iso:report test="normalize-space() != '' and lom:value and normalize-space(lom:value) = ''" diagnostics="P2Value-1.7_Element1.7EmptyValueRecommended">P2Value-1.7_Element1.7EmptyValueRecommended</iso:report>
        </iso:rule>
        <iso:rule context="lom:lom/lom:general/lom:aggregationLevel">
            <iso:assert test="normalize-space() != ''" diagnostics="E2-1.8_Element1.8EmptyRecommended">E2-1.8_Element1.8EmptyRecommended</iso:assert>
            <iso:report test="normalize-space() != '' and not(lom:source)" diagnostics="P1Source-1.8_Element1.8UndefinedSourceRecommended">P1Source-1.8_Element1.8UndefinedSourceRecommended</iso:report>
            <iso:report test="normalize-space() != '' and lom:source and normalize-space(lom:source) = ''" diagnostics="P2Source-1.8_Element1.8EmptySourceRecommended">P2Source-1.8_Element1.8EmptySourceRecommended</iso:report>
            <iso:report test="normalize-space() != '' and not(lom:value)" diagnostics="P1Value-1.8_Element1.8UndefinedValueRecommended">P1Value-1.8_Element1.8UndefinedValueRecommended</iso:report>
            <iso:report test="normalize-space() != '' and lom:value and normalize-space(lom:value) = ''" diagnostics="P2Value-1.8_Element1.8EmptyValueRecommended">P2Value-1.8_Element1.8ValueSourceRecommended</iso:report>
        </iso:rule>
    </iso:pattern>

    <iso:pattern id="MandatoryElements.LifeCycle">
        <iso:title>Validating LifeCycle category's mandatory elements</iso:title>
        <iso:rule context="lom:lom/lom:lifeCycle">
            <iso:assert test="lom:version" diagnostics="E1-2.1_Element2.1UndefinedMandatory">E1-2.1_Element2.1UndefinedMandatory</iso:assert>
            <iso:assert test="lom:contribute" diagnostics="E1-2.3_Element2.3UndefinedMandatory">E1-2.3_Element2.3UndefinedMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:lifeCycle/lom:version">
            <iso:assert test="normalize-space() != ''" diagnostics="E2-2.1_Element2.1EmptyMandatory">E2-2.1_Element2.1EmptyMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:lifeCycle/lom:contribute">
            <iso:assert test="lom:role" diagnostics="SE1-2.3.1_Element2.3.1UndefinedMandatory">SE1-2.3.1_Element2.3.1UndefinedMandatory</iso:assert>
            <iso:assert test="lom:entity" diagnostics="SE1-2.3.2_Element2.3.2UndefinedMandatory">SE1-2.3.2_Element2.3.2UndefinedMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:lifeCycle/lom:contribute/lom:role">
            <iso:assert test="normalize-space() != ''" diagnostics="Element2.3.1EmptyMandatory">Element2.3.1EmptyMandatory</iso:assert>
            <iso:report test="normalize-space() != '' and not(lom:source)" diagnostics="P1Source-2.3.1_Element2.3.1UndefinedSourceMandatory">P1Source-2.3.1_Element2.3.1UndefinedSourceMandatory</iso:report>
            <iso:report test="normalize-space() != '' and lom:source and normalize-space(lom:source) = ''" diagnostics="P2Source-2.3.1_Element2.3.1EmptySourceMandatory">P2Source-2.3.1_Element2.3.1EmptySourceMandatory</iso:report>
            <iso:report test="normalize-space() != '' and not(lom:value)" diagnostics="P1Value-2.3.1_Element2.3.1UndefinedValueMandatory">P1Value-2.3.1_Element2.3.1UndefinedValueMandatory</iso:report>
            <iso:report test="normalize-space() != '' and lom:value and normalize-space(lom:value) = ''" diagnostics="P2Value-2.3.1_Element2.3.1EmptyValueMandatory">P2Value-2.3.1_Element2.3.1EmptyValueMandatory</iso:report>
        </iso:rule>
        <iso:rule context="lom:lom/lom:lifeCycle/lom:contribute/lom:entity">
            <iso:assert test="normalize-space() != ''" diagnostics="SE2-2.3.2_Element2.3.2EmptyMandatory">SE2-2.3.2_Element2.3.2EmptyMandatory</iso:assert>
        </iso:rule>
    </iso:pattern>

    <iso:pattern id="ConditionalMandatoryElements.LifeCycle">
        <iso:title>Validating LifeCycle category's conditional mandatory elements</iso:title>
        <iso:rule context="lom:lom/lom:lifeCycle">
            <iso:assert test="count(lom:contribute/lom:date) > 0 and (string-length( string-join( for $s in lom:contribute/lom:date/lom:dateTime return( normalize-space( $s ) ), '' ) ) > 0 or //lom:date/lom:description/lom:string[normalize-space(text())='non disponible'] )" diagnostics="RC1-2.3.3_Element2.3.3UndefinedMandatory">RC1-2.3.3_Element2.3.3UndefinedMandatory</iso:assert>
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
            <iso:assert test="normalize-space() != ''" diagnostics="E2-2.2_Element2.2EmptyRecommended">E2-2.2_Element2.2EmptyRecommended</iso:assert>
            <iso:report test="normalize-space() != '' and not(lom:source)" diagnostics="P1Source-2.2_Element2.2UndefinedSourceRecommended">P1Source-2.2_Element2.2UndefinedSourceRecommended</iso:report>
            <iso:report test="normalize-space() != '' and lom:source and normalize-space(lom:source) = ''" diagnostics="P2Source-2.2_Element2.2EmptySourceRecommended">P2Source-2.2_Element2.2EmptySourceRecommended</iso:report>
            <iso:report test="normalize-space() != '' and not(lom:value)" diagnostics="P1Value-2.2_Element2.2UndefinedValueRecommended">P1Value-2.2_Element2.2UndefinedValueRecommended</iso:report>
            <iso:report test="normalize-space() != '' and lom:value and normalize-space(lom:value) = ''" diagnostics="P2Value-2.2_Element2.2EmptyValueRecommended">P2Value-2.2_Element2.2EmptyValueRecommended</iso:report>
        </iso:rule>
        <iso:rule context="lom:lom/lom:lifeCycle/lom:contribute">
            <iso:let name="isAtLeastOneDateSpecified" value="count(..//lom:date) > 0 and (string-length( string-join( for $s in ..//lom:date/lom:dateTime return( normalize-space( $s ) ), '' ) ) > 0 or ..//lom:date/lom:description/lom:string[normalize-space(text()) = 'non disponible'] )"/> 
            <!-- The first part of the condition makes sure that we apply this rule only if there is already a date specified.
                 Otherwise, this rule is not needed.  Another rule will be used instead. -->
            <iso:report test="$isAtLeastOneDateSpecified and (not(lom:date/lom:dateTime) and not(lom:date/lom:description/lom:string[normalize-space(text()) = 'non disponible']))" diagnostics="RC2-2.3.3_Element2.3.3UndefinedRecommended">RC2-2.3.3_Element2.3.3UndefinedRecommended</iso:report>
        </iso:rule>
        <iso:rule context="lom:lom/lom:lifeCycle/lom:contribute/lom:date">
            <iso:let name="isAtLeastOneDateSpecified" value="count(/lom:lom/lom:lifeCycle//lom:date) > 0 and (string-length( string-join( for $s in /lom:lom/lom:lifeCycle//lom:date/lom:dateTime return( normalize-space( $s ) ), '' ) ) > 0 or /lom:lom/lom:lifeCycle//lom:date/lom:description/lom:string[normalize-space(text()) = 'non disponible'] )"/> 
            <!-- The first part of the condition makes sure that we apply this rule only if there is already a date specified.
                 Otherwise, this rule is not needed.  Another rule will be used instead. -->
            <iso:report test="$isAtLeastOneDateSpecified and ( (lom:dateTime and normalize-space(lom:dateTime) = '') or (lom:description and normalize-space(lom:description/lom:string) = '') )" diagnostics="RC3-2.3.3_Element2.3.3EmptyRecommended">RC3-2.3.3_Element2.3.3EmptyRecommended</iso:report>
        </iso:rule>
    </iso:pattern>

    <iso:pattern id="MandatoryElements.MetaMetadata">
        <iso:title>Validating MetaMetadata category's mandatory elements</iso:title>
        <iso:rule context="lom:lom/lom:metaMetadata">
            <iso:assert test="lom:identifier" diagnostics="E1-3.1_Element3.1UndefinedMandatory">E1-3.1_Element3.1UndefinedMandatory</iso:assert>
            <iso:assert test="lom:metadataSchema" diagnostics="E1-3.3_Element3.3UndefinedMandatory">E1-3.3_Element3.3UndefinedMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:metaMetadata/lom:identifier">
            <iso:assert test="lom:catalog" diagnostics="SE1-3.1.1_Element3.1.1UndefinedMandatory">SE1-3.1.1_Element3.1.1UndefinedMandatory</iso:assert>
            <iso:assert test="lom:entry" diagnostics="SE1-3.1.2_Element3.1.2UndefinedMandatory">SE1-3.1.2_Element3.1.2UndefinedMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:metaMetadata/lom:identifier/lom:catalog">
            <iso:assert test="normalize-space() != ''" diagnostics="SE2-3.1.1_Element3.1.1EmptyMandatory">SE2-3.1.1_Element3.1.1EmptyMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:metaMetadata/lom:identifier/lom:entry">
            <iso:assert test="normalize-space() != ''" diagnostics="SE2-3.1.2_Element3.1.2EmptyMandatory">SE2-3.1.2_Element3.1.2EmptyMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:metaMetadata/lom:metadataSchema">
            <iso:assert test="normalize-space() != ''" diagnostics="E2-3.3_Element3.3EmptyMandatory">E2-3.3_Element3.3EmptyMandatory</iso:assert>
        </iso:rule>
    </iso:pattern>

    <!--iso:pattern id="ConditionalMandatoryElements.MetaMetadata">
        <iso:title>Validating MetaMetadata category's conditional mandatory elements</iso:title>
    </iso:pattern-->

    <!--iso:pattern id="ConditionalMandatoryElements.MetaMetadata.2">
        <iso:title>Validating MetaMetadata category's conditional mandatory elements (phase 2)</iso:title>
    </iso:pattern-->

    <iso:pattern id="RecommendedElements.MetaMetadata">
        <iso:title>Validating MetaMetadata category's recommended elements</iso:title>
        <iso:rule context="lom:lom/lom:metaMetadata/lom:contribute">
            <iso:assert test="normalize-space() != ''" diagnostics="SE2-3.2_Element3.2EmptyRecommended">SE2-3.2_Element3.2EmptyRecommended</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:metaMetadata/lom:contribute/lom:role">
            <iso:assert test="normalize-space() != ''" diagnostics="SE2-3.2.1_Element3.2.1EmptyRecommended">SE2-3.2.1_Element3.2.1EmptyRecommended</iso:assert>
            <iso:report test="normalize-space() != '' and not(lom:source)" diagnostics="P1Source-3.2.1_Element3.2.1UndefinedSourceRecommended">P1Source-3.2.1_Element3.2.1UndefinedSourceRecommended</iso:report>
            <iso:report test="normalize-space() != '' and lom:source and normalize-space(lom:source) = ''" diagnostics="P2Source-3.2.1_Element3.2.1EmptySourceRecommended">P2Source-3.2.1_Element3.2.1EmptySourceRecommended</iso:report>
            <iso:report test="normalize-space() != '' and not(lom:value)" diagnostics="P1Value-3.2.1_Element3.2.1UndefinedValueRecommended">P1Value-3.2.1_Element3.2.1UndefinedValueRecommended</iso:report>
            <iso:report test="normalize-space() != '' and lom:value and normalize-space(lom:value) = ''" diagnostics="P2Value-3.2.1_Element3.2.1EmptyValueRecommended">P2Value-3.2.1_Element3.2.1EmptyValueRecommended</iso:report>
        </iso:rule>
        <iso:rule context="lom:lom/lom:metaMetadata/lom:contribute/lom:entity">
            <iso:assert test="normalize-space() != ''" diagnostics="SE2-3.2.2_Element3.2.2EmptyRecommended">SE2-3.2.2_Element3.2.2EmptyRecommended</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:metaMetadata/lom:contribute/lom:date">
            <iso:assert test="normalize-space() != ''" diagnostics="SE2-3.2.3_Element3.2.3EmptyRecommended">SE2-3.2.3_Element3.2.3EmptyRecommended</iso:assert>
            <iso:report test="normalize-space() != '' and not(lom:dateTime)" diagnostics="P1DateTime-3.2.3_Element3.2.3UndefinedDateTimeRecommended">P1DateTime-3.2.3_Element3.2.3UndefinedDateTimeRecommended</iso:report>
            <iso:report test="normalize-space() != '' and lom:dateTime and normalize-space(lom:dateTime) = ''" diagnostics="P2DateTime-3.2.3_Element3.2.3EmptyDateTimeRecommended">P2DateTime-3.2.3_Element3.2.3EmptyDateTimeRecommended</iso:report>
            <iso:report test="normalize-space() != '' and not(lom:description)" diagnostics="P1Description-3.2.3_Element3.2.3UndefinedDescriptionRecommended">P1Description-3.2.3_Element3.2.3UndefinedDescriptionRecommended</iso:report>
            <iso:report test="normalize-space() != '' and lom:description and normalize-space(lom:description) = ''" diagnostics="P2Description-3.2.3_Element3.2.3EmptyDescriptionRecommended">P2Description-3.2.3_Element3.2.3EmptyDescriptionRecommended</iso:report>
        </iso:rule>
        <iso:rule context="lom:lom/lom:metaMetadata/lom:language">
            <iso:assert test="normalize-space() != ''" diagnostics="E2-3.4_Element3.4EmptyRecommended">E2-3.4_Element3.4EmptyRecommended</iso:assert>
        </iso:rule>

    </iso:pattern>

    <iso:pattern id="MandatoryElements.Technical">
        <iso:title>Validating Technical category's mandatory elements</iso:title>
        <iso:rule context="lom:lom/lom:technical">
            <iso:assert test="lom:format" diagnostics="E1-4.1_Element4.1UndefinedMandatory">E1-4.1_Element4.1UndefinedMandatory</iso:assert>
            <iso:assert test="lom:location" diagnostics="E1-4.3_Element4.3UndefinedMandatory">E1-4.3_Element4.3UndefinedMandatory</iso:assert>
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
            <iso:assert test="normalize-space() != ''" diagnostics="E2-4.2_Element4.2EmptyRecommended">E2-4.2_Element4.2EmptyRecommended</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:technical/lom:requirement/lom:orComposite/lom:type">
            <iso:assert test="normalize-space() != ''" diagnostics="SE2-4.4.1.1_Element4.4.1.1EmptyRecommended">SE2-4.4.1.1_Element4.4.1.1EmptyRecommended</iso:assert>
            <iso:report test="normalize-space() != '' and not(lom:source)" diagnostics="P1Source-4.4.1.1_Element4.4.1.1UndefinedSourceRecommended">P1Source-4.4.1.1_Element4.4.1.1UndefinedSourceRecommended</iso:report>
            <iso:report test="normalize-space() != '' and lom:source and normalize-space(lom:source) = ''" diagnostics="P2Source-4.4.1.1_Element4.4.1.1EmptySourceRecommended">P2Source-4.4.1.1_Element4.4.1.1EmptySourceRecommended</iso:report>
            <iso:report test="normalize-space() != '' and not(lom:value)" diagnostics="P1Value-4.4.1.1_Element4.4.1.1UndefinedValueRecommended">P1Value-4.4.1.1_Element4.4.1.1UndefinedValueRecommended</iso:report>
            <iso:report test="normalize-space() != '' and lom:value and normalize-space(lom:value) = ''" diagnostics="P2Value-4.4.1.1_Element4.4.1.1EmptyValueRecommended">P2Value-4.4.1.1_Element4.4.1.1EmptyValueRecommended</iso:report>
        </iso:rule>
        <iso:rule context="lom:lom/lom:technical/lom:requirement/lom:orComposite/lom:name">
            <iso:assert test="normalize-space() != ''" diagnostics="SE2-4.4.1.2_Element4.4.1.2EmptyRecommended">SE2-4.4.1.2_Element4.4.1.2EmptyRecommended</iso:assert>
            <iso:report test="normalize-space() != '' and not(lom:source)" diagnostics="P1Source-4.4.1.2_Element4.4.1.2UndefinedSourceRecommended">P1Source-4.4.1.2_Element4.4.1.2UndefinedSourceRecommended</iso:report>
            <iso:report test="normalize-space() != '' and lom:source and normalize-space(lom:source) = ''" diagnostics="P2Source-4.4.1.2_Element4.4.1.2EmptySourceRecommended">P2Source-4.4.1.2_Element4.4.1.2EmptySourceRecommended</iso:report>
            <iso:report test="normalize-space() != '' and not(lom:value)" diagnostics="P1Value-4.4.1.2_Element4.4.1.2UndefinedValueRecommended">P1Value-4.4.1.2_Element4.4.1.2UndefinedValueRecommended</iso:report>
            <iso:report test="normalize-space() != '' and lom:value and normalize-space(lom:value) = ''" diagnostics="P2Value-4.4.1.2_Element4.4.1.2EmptyValueRecommended">P2Value-4.4.1.2_Element4.4.1.2EmptyValueRecommended</iso:report>
        </iso:rule>
        <iso:rule context="lom:lom/lom:technical/lom:requirement/lom:orComposite/lom:minimumVersion">
            <iso:assert test="normalize-space() != ''" diagnostics="SE2-4.4.1.3_Element4.4.1.3EmptyRecommended">SE2-4.4.1.3_Element4.4.1.3EmptyRecommended</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:technical/lom:requirement/lom:orComposite/lom:maximumVersion">
            <iso:assert test="normalize-space() != ''" diagnostics="SE2-4.4.1.4_Element4.4.1.4EmptyRecommended">SE2-4.4.1.4_Element4.4.1.4EmptyRecommended</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:technical/lom:installationRemarks">
            <iso:assert test="normalize-space() != ''" diagnostics="E2-4.5_Element4.5EmptyRecommended">E2-4.5_Element4.5EmptyRecommended</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:technical/lom:otherPlatformRequirements">
            <iso:assert test="normalize-space() != ''" diagnostics="E2-4.6_Element4.6EmptyRecommended">E2-4.6_Element4.6EmptyRecommended</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:technical/lom:duration">
            <iso:assert test="normalize-space() != ''" diagnostics="E2-4.7_Element4.7EmptyRecommended">E2-4.7_Element4.7EmptyRecommended</iso:assert>
            <iso:report test="normalize-space() != '' and not(lom:duration)" diagnostics="P1Duration-4.7_Element4.7UndefinedDurationRecommended">P1Duration-4.7_Element4.7UndefinedDurationRecommended</iso:report>
            <iso:report test="normalize-space() != '' and lom:duration and normalize-space(lom:duration) = ''" diagnostics="P2Duration-4.7_Element4.7EmptyDurationRecommended">P2Duration-4.7_Element4.7EmptyDurationRecommended</iso:report>
        </iso:rule>
    </iso:pattern>

    <iso:pattern id="MandatoryElements.Educational">
        <iso:title>Validating Educational category's mandatory elements</iso:title>
        <iso:rule context="lom:lom/lom:educational">
            <iso:assert test="lom:learningResourceType" diagnostics="E1-5.2_Element5.2UndefinedMandatory">E1-5.2_Element5.2UndefinedMandatory</iso:assert>
            <iso:assert test="lom:context" diagnostics="E1-5.6_Element5.6UndefinedMandatory">E1-5.6_Element5.6UndefinedMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:educational/lom:learningResourceType">
            <iso:assert test="normalize-space() != ''" diagnostics="Element5.2EmptyMandatory">Element5.2EmptyMandatory</iso:assert>
            <iso:report test="normalize-space() != '' and not(lom:source)" diagnostics="P1Source-5.2_Element5.2UndefinedSourceMandatory">P1Source-5.2_Element5.2UndefinedSourceMandatory</iso:report>
            <iso:report test="normalize-space() != '' and lom:source and normalize-space(lom:source) = ''" diagnostics="P2Source-5.2_Element5.2EmptySourceMandatory">P2Source-5.2_Element5.2EmptySourceMandatory</iso:report>
            <iso:report test="normalize-space() != '' and not(lom:value)" diagnostics="P1Value-5.2_Element5.2UndefinedValueMandatory">P1Value-5.2_Element5.2UndefinedValueMandatory</iso:report>
            <iso:report test="normalize-space() != '' and lom:value and normalize-space(lom:value) = ''" diagnostics="P2Value-5.2_Element5.2EmptyValueMandatory">P2Value-5.2_Element5.2EmptyValueMandatory</iso:report>
        </iso:rule>
        <iso:rule context="lom:lom/lom:educational/lom:context">
            <iso:assert test="normalize-space() != ''" diagnostics="Element5.6EmptyMandatory">Element5.6EmptyMandatory</iso:assert>
            <iso:report test="normalize-space() != '' and not(lom:source)" diagnostics="P1Source-5.6_Element5.6UndefinedSourceMandatory">P1Source-5.6_Element5.6UndefinedSourceMandatory</iso:report>
            <iso:report test="normalize-space() != '' and lom:source and normalize-space(lom:source) = ''" diagnostics="P2Source-5.6_Element5.6EmptySourceMandatory">P2Source-5.6_Element5.6EmptySourceMandatory</iso:report>
            <iso:report test="normalize-space() != '' and not(lom:value)" diagnostics="P1Value-5.6_Element5.6UndefinedValueMandatory">P1Value-5.6_Element5.6UndefinedValueMandatory</iso:report>
            <iso:report test="normalize-space() != '' and lom:value and normalize-space(lom:value) = ''" diagnostics="P2Value-5.6_Element5.6EmptyValueMandatory">P2Value-5.6_Element5.6EmptyValueMandatory</iso:report>
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
        <iso:rule context="lom:lom/lom:educational/lom:interactivityType">
            <iso:assert test="normalize-space() != ''" diagnostics="E2-5.1_Element5.1EmptyRecommended">E2-5.1_Element5.1EmptyRecommended</iso:assert>
            <iso:report test="normalize-space() != '' and not(lom:source)" diagnostics="P1Source-5.1_Element5.1UndefinedSourceRecommended">P1Source-5.1_Element5.1UndefinedSourceRecommended</iso:report>
            <iso:report test="normalize-space() != '' and lom:source and normalize-space(lom:source) = ''" diagnostics="P2Source-5.1_Element5.1EmptySourceRecommended">P2Source-5.1_Element5.1EmptySourceRecommended</iso:report>
            <iso:report test="normalize-space() != '' and not(lom:value)" diagnostics="P1Value-5.1_Element5.1UndefinedValueRecommended">P1Value-5.1_Element5.1UndefinedValueRecommended</iso:report>
            <iso:report test="normalize-space() != '' and lom:value and normalize-space(lom:value) = ''" diagnostics="P2Value-5.1_Element5.1EmptyValueRecommended">P2Value-5.1_Element5.1EmptyValueRecommended</iso:report>
        </iso:rule>
        <iso:rule context="lom:lom/lom:educational/lom:interactivityLevel">
            <iso:assert test="normalize-space() != ''" diagnostics="E2-5.3_Element5.3EmptyRecommended">E2-5.3_Element5.3EmptyRecommended</iso:assert>
            <iso:report test="normalize-space() != '' and not(lom:source)" diagnostics="P1Source-5.3_Element5.3UndefinedSourceRecommended">P1Source-5.3_Element5.3UndefinedSourceRecommended</iso:report>
            <iso:report test="normalize-space() != '' and lom:source and normalize-space(lom:source) = ''" diagnostics="P2Source-5.3_Element5.3EmptySourceRecommended">P2Source-5.3_Element5.3EmptySourceRecommended</iso:report>
            <iso:report test="normalize-space() != '' and not(lom:value)" diagnostics="P1Value-5.3_Element5.3UndefinedValueRecommended">P1Value-5.3_Element5.3UndefinedValueRecommended</iso:report>
            <iso:report test="normalize-space() != '' and lom:value and normalize-space(lom:value) = ''" diagnostics="P2Value-5.3_Element5.3EmptyValueRecommended">P2Value-5.3_Element5.3EmptyValueRecommended</iso:report>
        </iso:rule>
        <iso:rule context="lom:lom/lom:educational/lom:semanticDensity">
            <iso:assert test="normalize-space() != ''" diagnostics="E2-5.4_Element5.4EmptyRecommended">E2-5.4_Element5.4EmptyRecommended</iso:assert>
            <iso:report test="normalize-space() != '' and not(lom:source)" diagnostics="P1Source-5.4_Element5.4UndefinedSourceRecommended">P1Source-5.4_Element5.4UndefinedSourceRecommended</iso:report>
            <iso:report test="normalize-space() != '' and lom:source and normalize-space(lom:source) = ''" diagnostics="P2Source-5.4_Element5.4EmptySourceRecommended">P2Source-5.4_Element5.4EmptySourceRecommended</iso:report>
            <iso:report test="normalize-space() != '' and not(lom:value)" diagnostics="P1Value-5.4_Element5.4UndefinedValueRecommended">P1Value-5.4_Element5.4UndefinedValueRecommended</iso:report>
            <iso:report test="normalize-space() != '' and lom:value and normalize-space(lom:value) = ''" diagnostics="P2Value-5.4_Element5.4EmptyValueRecommended">P2Value-5.4_Element5.4EmptyValueRecommended</iso:report>
        </iso:rule>
        <iso:rule context="lom:lom/lom:educational/lom:intendedEndUserRole">
            <iso:assert test="normalize-space() != ''" diagnostics="E2-5.5_Element5.5EmptyRecommended">E2-5.5_Element5.5EmptyRecommended</iso:assert>
            <iso:report test="normalize-space() != '' and not(lom:source)" diagnostics="P1Source-5.5_Element5.5UndefinedSourceRecommended">P1Source-5.5_Element5.5UndefinedSourceRecommended</iso:report>
            <iso:report test="normalize-space() != '' and lom:source and normalize-space(lom:source) = ''" diagnostics="P2Source-5.5_Element5.5EmptySourceRecommended">P2Source-5.5_Element5.5EmptySourceRecommended</iso:report>
            <iso:report test="normalize-space() != '' and not(lom:value)" diagnostics="P1Value-5.5_Element5.5UndefinedValueRecommended">P1Value-5.5_Element5.5UndefinedValueRecommended</iso:report>
            <iso:report test="normalize-space() != '' and lom:value and normalize-space(lom:value) = ''" diagnostics="P2Value-5.5_Element5.5EmptyValueRecommended">P2Value-5.5_Element5.5EmptyValueRecommended</iso:report>
        </iso:rule>
        <iso:rule context="lom:lom/lom:educational/lom:typicalAgeRange">
            <iso:assert test="normalize-space() != ''" diagnostics="E2-5.7_Element5.7EmptyRecommended">E2-5.7_Element5.7EmptyRecommended</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:educational/lom:difficulty">
            <iso:assert test="normalize-space() != ''" diagnostics="E2-5.8_Element5.8EmptyRecommended">E2-5.8_Element5.8EmptyRecommended</iso:assert>
            <iso:report test="normalize-space() != '' and not(lom:source)" diagnostics="P1Source-5.8_Element5.8UndefinedSourceRecommended">P1Source-5.8_Element5.8UndefinedSourceRecommended</iso:report>
            <iso:report test="normalize-space() != '' and lom:source and normalize-space(lom:source) = ''" diagnostics="P2Source-5.8_Element5.8EmptySourceRecommended">P2Source-5.8_Element5.8EmptySourceRecommended</iso:report>
            <iso:report test="normalize-space() != '' and not(lom:value)" diagnostics="P1Value-5.8_Element5.8UndefinedValueRecommended">P1Value-5.8_Element5.8UndefinedValueRecommended</iso:report>
            <iso:report test="normalize-space() != '' and lom:value and normalize-space(lom:value) = ''" diagnostics="P2Value-5.8_Element5.8EmptyValueRecommended">P2Value-5.8_Element5.8EmptyValueRecommended</iso:report>
        </iso:rule>
        <iso:rule context="lom:lom/lom:educational/lom:typicalLearningTime">
            <iso:assert test="normalize-space() != ''" diagnostics="E2-5.9_Element5.9EmptyRecommended">E2-5.9_Element5.9EmptyRecommended</iso:assert>
            <iso:report test="normalize-space() != '' and not(lom:duration)" diagnostics="P1Duration-5.9_Element5.9UndefinedDurationRecommended">P1Duration-5.9_Element5.9UndefinedDurationRecommended</iso:report>
            <iso:report test="normalize-space() != '' and lom:duration and normalize-space(lom:duration) = ''" diagnostics="P2Duration-5.9_Element5.9EmptyDurationRecommended">P2Duration-5.9_Element5.9EmptyDurationRecommended</iso:report>
        </iso:rule>
        <iso:rule context="lom:lom/lom:educational/lom:description">
            <iso:assert test="normalize-space() != ''" diagnostics="E2-5.10_Element5.10EmptyRecommended">E2-5.10_Element5.10EmptyRecommended</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:educational/lom:language">
            <iso:assert test="normalize-space() != ''" diagnostics="E2-5.11_Element5.11EmptyRecommended">E2-5.11_Element5.11EmptyRecommended</iso:assert>
        </iso:rule>
    </iso:pattern>

    <iso:pattern id="MandatoryElements.Rights">
        <iso:title>Validating Rights category's mandatory elements</iso:title>
        <iso:rule context="lom:lom/lom:rights">
            <iso:assert test="lom:cost" diagnostics="E1-6.1_Element6.1UndefinedMandatory">E1-6.1_Element6.1UndefinedMandatory</iso:assert>
            <iso:assert test="lom:copyrightAndOtherRestrictions" diagnostics="E1-6.2_Element6.2UndefinedMandatory">E1-6.2_Element6.2UndefinedMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:rights/lom:cost">
            <iso:assert test="normalize-space() != ''" diagnostics="E2-6.1_Element6.1EmptyMandatory">E2-6.1_Element6.1EmptyMandatory</iso:assert>
            <iso:report test="normalize-space() != '' and not(lom:source)" diagnostics="P1Source-6.1_Element6.1UndefinedSourceMandatory">P1Source-6.1_Element6.1UndefinedSourceMandatory</iso:report>
            <iso:report test="normalize-space() != '' and lom:source and normalize-space(lom:source) = ''" diagnostics="P2Source-6.1_Element6.1EmptySourceMandatory">P2Source-6.1_Element6.1EmptySourceMandatory</iso:report>
            <iso:report test="normalize-space() != '' and not(lom:value)" diagnostics="P1Value-6.1_Element6.1UndefinedValueMandatory">P1Value-6.1_Element6.1UndefinedValueMandatory</iso:report>
            <iso:report test="normalize-space() != '' and lom:value and normalize-space(lom:value) = ''" diagnostics="P2Value-6.1_Element6.1EmptyValueMandatory">P2Value-6.1_Element6.1EmptyValueMandatory</iso:report>
        </iso:rule>
        <iso:rule context="lom:lom/lom:rights/lom:copyrightAndOtherRestrictions">
            <iso:assert test="normalize-space() != ''" diagnostics="E2-6.2_Element6.2EmptyMandatory">E2-6.2_Element6.2EmptyMandatory</iso:assert>
            <iso:report test="normalize-space() != '' and not(lom:source)" diagnostics="P1Source-6.2_Element6.2UndefinedSourceMandatory">P1Source-6.2_Element6.2UndefinedSourceMandatory</iso:report>
            <iso:report test="normalize-space() != '' and lom:source and normalize-space(lom:source) = ''" diagnostics="P2Source-6.2_Element6.2EmptySourceMandatory">P2Source-6.2_Element6.2EmptySourceMandatory</iso:report>
            <iso:report test="normalize-space() != '' and not(lom:value)" diagnostics="P1Value-6.2_Element6.2UndefinedValueMandatory">P1Value-6.2_Element6.2UndefinedValueMandatory</iso:report>
            <iso:report test="normalize-space() != '' and lom:value and normalize-space(lom:value) = ''" diagnostics="P2Value-6.2_Element6.2EmptyValueMandatory">P2Value-6.2_Element6.2EmptyValueMandatory</iso:report>
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
            <iso:assert test="lom:kind" diagnostics="E1-7.1_Element7.1UndefinedRecommended">E1-7.1_Element7.1UndefinedRecommended</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:relation/lom:kind">
            <iso:assert test="normalize-space() != ''" diagnostics="E2-7.1_Element7.1EmptyRecommended">E2-7.1_Element7.1EmptyRecommended</iso:assert>
            <iso:report test="normalize-space() != '' and not(lom:source)" diagnostics="P1Source-7.1_Element7.1UndefinedSourceRecommended">P1Source-7.1_Element7.1UndefinedSourceRecommended</iso:report>
            <iso:report test="normalize-space() != '' and lom:source and normalize-space(lom:source) = ''" diagnostics="P2Source-7.1_Element7.1EmptySourceRecommended">P2Source-7.1_Element7.1EmptySourceRecommended</iso:report>
            <iso:report test="normalize-space() != '' and not(lom:value)" diagnostics="P1Value-7.1_Element7.1UndefinedValueRecommended">P1Value-7.1_Element7.1UndefinedValueRecommended</iso:report>
            <iso:report test="normalize-space() != '' and lom:value and normalize-space(lom:value) = ''" diagnostics="P2Value-7.1_Element7.1EmptyValueRecommended">P2Value-7.1_Element7.1EmptyValueRecommended</iso:report>
        </iso:rule>
        <iso:rule context="lom:lom/lom:relation/lom:resource/lom:identifier/lom:catalog">
            <iso:assert test="normalize-space() != ''" diagnostics="SE2-7.2.1.1_Element7.2.1.1EmptyRecommended">SE2-7.2.1.1_Element7.2.1.1EmptyRecommended</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:relation/lom:resource/lom:identifier/lom:entry">
            <iso:assert test="normalize-space() != ''" diagnostics="SE2-7.2.1.2_Element7.2.1.2EmptyRecommended">SE2-7.2.1.2_Element7.2.1.2EmptyRecommended</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:relation/lom:resource/lom:description">
            <iso:assert test="normalize-space() != ''" diagnostics="SE2-7.2.2_Element7.2.2EmptyRecommended">SE2-7.2.2_Element7.2.2EmptyRecommended</iso:assert>
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

    <iso:pattern id="RecommendedElements.Annotation">
        <iso:title>Validating Annotation category's recommended elements</iso:title>
        <iso:rule context="lom:lom/lom:annotation/lom:entity">
            <iso:assert test="normalize-space() != ''" diagnostics="E2-8.1_Element8.1EmptyRecommended">E2-8.1_Element8.1EmptyRecommended</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:annotation/lom:date">
            <iso:assert test="normalize-space() != ''" diagnostics="E2-8.2_Element8.2EmptyRecommended">E2-8.2_Element8.2EmptyRecommended</iso:assert>
            <iso:report test="normalize-space() != '' and not(lom:dateTime)" diagnostics="P1DateTime-8.2_Element8.2UndefinedDateTimeRecommended">P1DateTime-8.2_Element8.2UndefinedDateTimeRecommended</iso:report>
            <iso:report test="normalize-space() != '' and lom:dateTime and normalize-space(lom:dateTime) = ''" diagnostics="P2DateTime-8.2_Element8.2EmptyDateTimeRecommended">P2DateTime-8.2_Element8.2EmptyDateTimeRecommended</iso:report>
            <iso:report test="normalize-space() != '' and not(lom:description)" diagnostics="P1Description-8.2_Element8.2UndefinedDescriptionRecommended">P1Description-8.2_Element8.2UndefinedDescriptionRecommended</iso:report>
            <iso:report test="normalize-space() != '' and lom:description and normalize-space(lom:description) = ''" diagnostics="P2Description-8.2_Element8.2EmptyDescriptionRecommended">P2Description-8.2_Element8.2EmptyDescriptionRecommended</iso:report>
        </iso:rule>
        <iso:rule context="lom:lom/lom:annotation/lom:description">
            <iso:assert test="normalize-space() != ''" diagnostics="E2-8.3_Element8.3EmptyRecommended">E2-8.3_Element8.3EmptyRecommended</iso:assert>
        </iso:rule>
    </iso:pattern>

    <iso:pattern id="MandatoryElements.Classification">
        <iso:title>Validating Classification category's mandatory elements</iso:title>
        <iso:rule context="lom:lom/lom:classification">
            <iso:assert test="lom:purpose" diagnostics="E1-9.1_Element9.1UndefinedMandatory">E1-9.1_Element9.1UndefinedMandatory</iso:assert>
            <iso:assert test="lom:taxonPath" diagnostics="E1-9.2_Element9.2UndefinedMandatory">E1-9.2_Element9.2UndefinedMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:classification/lom:purpose">
            <iso:assert test="normalize-space() != ''" diagnostics="E2-9.1_Element9.1EmptyMandatory">E2-9.1_Element9.1EmptyMandatory</iso:assert>
            <iso:report test="normalize-space() != '' and not(lom:source)" diagnostics="P1Source-9.1_Element9.1UndefinedSourceMandatory">P1Source-9.1_Element9.1UndefinedSourceMandatory</iso:report>
            <iso:report test="normalize-space() != '' and lom:source and normalize-space(lom:source) = ''" diagnostics="P2Source-9.1_Element9.1EmptySourceMandatory">P2Source-9.1_Element9.1EmptySourceMandatory</iso:report>
            <iso:report test="normalize-space() != '' and not(lom:value)" diagnostics="P1Value-9.1_Element9.1UndefinedValueMandatory">P1Value-9.1_Element9.1UndefinedValueMandatory</iso:report>
            <iso:report test="normalize-space() != '' and lom:value and normalize-space(lom:value) = ''" diagnostics="P2Value-9.1_Element9.1EmptyValueMandatory">P2Value-9.1_Element9.1EmptyValueMandatory</iso:report>
        </iso:rule>
        <iso:rule context="lom:lom/lom:classification/lom:taxonPath">
            <iso:assert test="lom:source" diagnostics="SE1-9.2.1_Element9.2.1UndefinedMandatory">SE1-9.2.1_Element9.2.1UndefinedMandatory</iso:assert>
            <iso:assert test="lom:taxon" diagnostics="Element9.2.2UndefinedMandatory">Element9.2.2UndefinedMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:classification/lom:taxonPath/lom:source">
            <iso:assert test="normalize-space() != ''" diagnostics="SE2-9.2.1_Element9.2.1EmptyMandatory">SE2-9.2.1_Element9.2.1EmptyMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:classification/lom:taxonPath/lom:taxon">
            <iso:let name="isEntryRequired" value="../lom:purpose/lom:value[normalize-space(text())='discipline' or normalize-space(text())='idea'] or not(lom:identifier) or normalize-space(lom:identifier) = ''"/>
            <iso:assert test="lom:id" diagnostics="SE1-9.2.2.1_Element9.2.2.1UndefinedMandatory">SE1-9.2.2.1_Element9.2.2.1UndefinedMandatory</iso:assert>
            <iso:report test="$isEntryRequired and not(lom:entry)" diagnostics="SE1-9.2.2.2_Element9.2.2.2UndefinedMandatory">SE1-9.2.2.2_Element9.2.2.2UndefinedMandatory</iso:report>
        </iso:rule>
        <iso:rule context="lom:lom/lom:classification/lom:taxonPath/lom:taxon/lom:id">
            <iso:assert test="normalize-space() != ''" diagnostics="SE2-9.2.2.1_Element9.2.2.1EmptyMandatory">SE2-9.2.2.1_Element9.2.2.1EmptyMandatory</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:classification/lom:taxonPath/lom:taxon/lom:entry">
            <iso:let name="isEntryRequired" value="../../lom:purpose/lom:value[normalize-space(text())='discipline' or normalize-space(text())='idea'] or not(../lom:identifier) or normalize-space(../lom:identifier) = ''"/>
            <iso:report test="$isEntryRequired and normalize-space() = ''" diagnostics="SE2-9.2.2.2_Element9.2.2.2EmptyMandatory">SE2-9.2.2.2_Element9.2.2.2EmptyMandatory</iso:report>
        </iso:rule>
    </iso:pattern>

    <!--iso:pattern id="ConditionalMandatoryElements.Classification">
        <iso:title>Validating Classification category's conditional mandatory elements</iso:title>
    </iso:pattern-->

    <!--iso:pattern id="ConditionalMandatoryElements.Classification.2">
        <iso:title>Validating Classification category's conditional mandatory elements (phase 2)</iso:title>
    </iso:pattern-->

    <iso:pattern id="RecommendedElements.Classification">
        <iso:title>Validating Classification category's recommended elements</iso:title>
        <iso:rule context="lom:lom/lom:classification/lom:description">
            <iso:assert test="normalize-space() != ''" diagnostics="E2-9.3_Element9.3EmptyRecommended">E2-9.3_Element9.3EmptyRecommended</iso:assert>
        </iso:rule>
        <iso:rule context="lom:lom/lom:classification/lom:keyword">
            <iso:assert test="normalize-space() != ''" diagnostics="E2-9.4_Element9.4EmptyRecommended">E2-9.4_Element9.4EmptyRecommended</iso:assert>
        </iso:rule>
    </iso:pattern>

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
            <iso:report test="normalize-space($source) != '' and $source != 'LOMv1.0' and $source != 'http://www.normetic.org/vdex/typeressourcev1_2.xml'" diagnostics="UnrecognizedVocabularySourceForElement5.2">UnrecognizedVocabularySourceForElement5.2</iso:report>
            <iso:report test="$value and $source = 'LOMv1.0' and not(document('LOMv1.0_element_5_2_learning_resource_type_voc.xml')//vdx:termIdentifier[normalize-space(text()) = $value])" diagnostics="P3Value-5.2_InvalidVocabularyForElement5.2">P3Value-5.2_InvalidVocabularyForElement5.2</iso:report>
            <iso:report test="$value and $source = 'http://www.normetic.org/vdex/typeressourcev1_2.xml' and not(document('typeressourcev1_2.xml')//vdx:termIdentifier[normalize-space(text()) = $value])" diagnostics="P3Value-5.2_InvalidVocabularyForElement5.2">P3Value-5.2_InvalidVocabularyForElement5.2</iso:report>
        </iso:rule>

        <iso:rule context="lom:lom/lom:educational/lom:context">
            <iso:let name="source" value="normalize-space(lom:source/text())"/>
            <iso:let name="value" value="normalize-space(current()/lom:value/text())"/>
            <iso:report test="normalize-space($source) != '' and $source != 'LOMv1.0' and $source != 'http://eureka.ntic.org/vdex/NORMETICv1.0_element_5_6_contexte_voc.xml'" diagnostics="UnrecognizedVocabularySourceForElement5.6">UnrecognizedVocabularySourceForElement5.6</iso:report>
            <iso:report test="$value and $source = 'LOMv1.0' and not(document('LOMv1.0_element_5_6_context_voc.xml')//vdx:termIdentifier[normalize-space(text()) = $value])" diagnostics="P3Value-5.6_InvalidVocabularyForElement5.6">P3Value-5.6_InvalidVocabularyForElement5.6</iso:report>
            <iso:report test="$value and $source = 'http://eureka.ntic.org/vdex/NORMETICv1.0_element_5_6_contexte_voc.xml' and not(document('NORMETICv1.0_element_5_6_contexte_voc.xml')//vdx:termIdentifier[normalize-space(text()) = $value])" diagnostics="P3Value-5.6_InvalidVocabularyForElement5.6">P3Value-5.6_InvalidVocabularyForElement5.6</iso:report>
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
        <iso:diagnostic id="C1-1_GeneralCategoryMandatory" xml:lang="en">Category 1-General is not defined.  This category is mandatory.</iso:diagnostic>  
        <iso:diagnostic id="C1-2_LifeCycleCategoryMandatory" xml:lang="en">Category 2-LifeCycle is not defined.  This category is mandatory.</iso:diagnostic>
        <iso:diagnostic id="C1-3_MetaMetaDataCategoryMandatory" xml:lang="en">Category 3-MetaMetadata is not defined.  This category is mandatory.</iso:diagnostic>
        <iso:diagnostic id="C1-4_TechnicalCategoryMandatory" xml:lang="en">Category 4-Technical is not defined.  This category is mandatory.</iso:diagnostic>
        <iso:diagnostic id="C1-5_EducationalCategoryMandatory" xml:lang="en">Category 5-Educational is not defined.  This category is mandatory.</iso:diagnostic>
        <iso:diagnostic id="C1-6_RightsCategoryMandatory" xml:lang="en">Category 6-Rights is not defined.  This category is mandatory.</iso:diagnostic>
        <iso:diagnostic id="C1-9_ClassificationCategoryMandatory" xml:lang="en">Category 9-Classification is not defined.  This category is mandatory.</iso:diagnostic> 

        <!-- Mandatory Elements (General) -->
        <iso:diagnostic id="E1-1.2_Element1.2UndefinedMandatory" xml:lang="en">Element 1.2-Title is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="E1-1.3_Element1.3UndefinedMandatory" xml:lang="en">Element 1.3-Language is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="E1-1.4_Element1.4UndefinedMandatory" xml:lang="en">Element 1.4-Description is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="E2-1.2_Element1.2EmptyMandatory" xml:lang="en">Element 1.2-Title is empty.  This element is mandatory.</iso:diagnostic>
        <!--iso:diagnostic id="E2-1.3_Element1.3EmptyMandatory" xml:lang="en">Element 1.3-Language is empty.  This element is mandatory.</iso:diagnostic-->
        <iso:diagnostic id="E2-1.4_Element1.4EmptyMandatory" xml:lang="en">Element 1.4-Description is empty.  This element is mandatory.</iso:diagnostic>

        <!-- Conditional Mandatory Elements (General) -->
        <iso:diagnostic id="Element1.5UndefinedOrEmptyPhase2Required" xml:lang="en">Element 1.5-Keyword is not defined or is empty.  *** VALIDATION PHASE 2 REQUIRED ***</iso:diagnostic>
        <iso:diagnostic id="Element1.5UndefinedOrEmptyMandatory" xml:lang="en">Element 1.5-Keyword is not defined or is empty.  As no classification with purpose 'discipline' or 'idea' are defined, this element is mandatory.</iso:diagnostic>

        <!-- Recommended Categories -->
        <iso:diagnostic id="RelationCategoryRecommended" xml:lang="en">Category 7-Relation is not defined.  This category is recommended.</iso:diagnostic>  

        <!-- Recommended Elements (General) -->
        <iso:diagnostic id="Element1.1UndefinedRecommended" xml:lang="en">Element 1.1-Identifier is not defined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="Element1.1.1UndefinedRecommended" xml:lang="en">Element 1.1.1-Catalog is not defined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="Element1.1.2UndefinedRecommended" xml:lang="en">Element 1.1.2-Entry is not defined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="SE2-1.1.1_Element1.1.1EmptyRecommended" xml:lang="en">SE2-1.1.1_Element 1.1.1-Catalog is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="SE2-1.1.2_Element1.1.2EmptyRecommended" xml:lang="en">SE2-1.1.2_Element 1.1.2-Entry is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="E2-1.6_Element1.6EmptyRecommended" xml:lang="en">E2-1.6_Element 1.6-Coverage is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="E2-1.7_Element1.7EmptyRecommended" xml:lang="en">E2-1.7_Element 1.7-Structure is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="E1Source-1.7_Element1.7UndefinedSourceRecommended" xml:lang="en">E1Source-1.7_Element Source of 1.7-Structure is undefined.  This element is recommended.</iso:diagnostic>
        <!--iso:diagnostic id="P2Source-1.7_Element1.7EmptySourceRecommended" xml:lang="en">P2Source-1.7_Element Source of 1.7-Structure is empty.  This element is recommended.</iso:diagnostic-->
        <iso:diagnostic id="E1Value-1.7_Element1.7UndefinedValueRecommended" xml:lang="en">E1Value-1.7_Element Value of 1.7-Structure is undefined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P2Value-1.7_Element1.7EmptyValueRecommended" xml:lang="en">P2Value-1.7_Element Value of 1.7-Structure is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="E2-1.8_Element1.8EmptyRecommended" xml:lang="en">E2-1.8_Element 1.8-Aggregation Level is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P1Source-1.8_Element1.8UndefinedSourceRecommended" xml:lang="en">P1Source-1.8_Element Source of 1.8-AggregationLevel is undefined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P2Source-1.8_Element1.8EmptySourceRecommended" xml:lang="en">P2Source-1.8_Element Source of 1.8-AggregationLevel is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P1Value-1.8_Element1.8UndefinedValueRecommended" xml:lang="en">P1Value-1.8_Element Value of 1.8-AggregationLevel is undefined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P2Value-1.8_Element1.8EmptyValueRecommended" xml:lang="en">P2Value-1.8_Element Value of 1.8-AggregationLevel is empty.  This element is recommended.</iso:diagnostic>

        <!-- Mandatory Elements (LifeCycle) -->
        <iso:diagnostic id="E1-2.1_Element2.1UndefinedMandatory" xml:lang="en">Element 2.1-Version is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="E1-2.3_Element2.3UndefinedMandatory" xml:lang="en">Element 2.3-Contribute is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="E2-2.1_Element2.1EmptyMandatory" xml:lang="en">Element 2.1-Version is empty.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="SE1-2.3.1_Element2.3.1UndefinedMandatory" xml:lang="en">SE1-2.3.1_Element 2.3.1-Role is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="P1Source-2.3.1_Element2.3.1UndefinedSourceMandatory" xml:lang="en">P1Source-2.3.1_Element Source of 2.3.1-Role is undefined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="P2Source-2.3.1_Element2.3.1EmptySourceMandatory" xml:lang="en">P2Source-2.3.1_Element Source of 2.3.1-Role is empty.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="P1Value-2.3.1_Element2.3.1UndefinedValueMandatory" xml:lang="en">P1Value-2.3.1_Element Value of 2.3.1-Role is undefined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="P2Value-2.3.1_Element2.3.1EmptyValueMandatory" xml:lang="en">P2Value-2.3.1_Element Value of 2.3.1-Role is empty.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="SE1-2.3.2_Element2.3.2UndefinedMandatory" xml:lang="en">SE1-2.3.2_Element 2.3.2-Entity is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element2.3.1EmptyMandatory" xml:lang="en">Element 2.3.1-Role is empty.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="SE2-2.3.2_Element2.3.2EmptyMandatory" xml:lang="en">SE2-2.3.2_Element 2.3.2-Entity is empty.  This element is mandatory.</iso:diagnostic>

        <!-- Conditional Mandatory Elements (LifeCycle) -->
        <iso:diagnostic id="RC1-2.3.3_Element2.3.3UndefinedMandatory" xml:lang="en">RC1-2.3.3_Element 2.3.3-Date is not defined.  This element is mandatory for at least one contributor.  In case you don't know the date of contribution, please enter 'non disponible' in the description field.</iso:diagnostic>

        <!-- Recommended Elements (LifeCycle) -->
        <iso:diagnostic id="Element2.2UndefinedRecommended" xml:lang="en">Element 2.2-Status is not defined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="E2-2.2_Element2.2EmptyRecommended" xml:lang="en">E2-2.2_Element 2.2-Status is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P1Source-2.2_Element2.2UndefinedSourceRecommended" xml:lang="en">P1Source-2.2_Element Source of 2.2-Status is undefined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P2Source-2.2_Element2.2EmptySourceRecommended" xml:lang="en">P2Source-2.2_Element Source of 2.2-Status is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P1Value-2.2_Element2.2UndefinedValueRecommended" xml:lang="en">P1Value-2.2_Element Value of 2.2-Status is undefined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P2Value-2.2_Element2.2EmptyValueRecommended" xml:lang="en">P2Value-2.2_Element Value of 2.2-Status is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="RC2-2.3.3_Element2.3.3UndefinedRecommended" xml:lang="en">RC2-2.3.3_Element 2.3.3-Date is not defined.  This element is recommended.  In case you don't know the date of contribution, please enter 'non disponible' in the description field.</iso:diagnostic>
        <iso:diagnostic id="RC3-2.3.3_Element2.3.3EmptyRecommended" xml:lang="en">RC3-2.3.3_Element 2.3.3-Date is empty.  This element is recommended.  In case you don't know the date of contribution, please enter 'non disponible' in the description field.</iso:diagnostic>

        <!-- Mandatory Elements (MetaMetadata) -->
        <iso:diagnostic id="E1-3.1_Element3.1UndefinedMandatory" xml:lang="en">Element 3.1-Identifier is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="E1-3.3_Element3.3UndefinedMandatory" xml:lang="en">Element 3.3-MetadataSchema is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="SE1-3.1.1_Element3.1.1UndefinedMandatory" xml:lang="en">SE1-3.1.1_Element 3.1.1-Catalog is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="SE1-3.1.2_Element3.1.2UndefinedMandatory" xml:lang="en">SE1-3.1.2_Element 3.1.2-Entry is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="SE2-3.1.1_Element3.1.1EmptyMandatory" xml:lang="en">SE2-3.1.1_Element 3.1.1-Catalog is empty.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="SE2-3.1.2_Element3.1.2EmptyMandatory" xml:lang="en">SE2-3.1.2_Element 3.1.2-Entry is empty.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="E2-3.3_Element3.3EmptyMandatory" xml:lang="en">Element 3.3-MetadataSchema is empty.  This element is mandatory.</iso:diagnostic>


        <!-- Recommended Elements (MetaMetadata) -->
        <iso:diagnostic id="SE2-3.2_Element3.2EmptyRecommended" xml:lang="en">SE2-3.2_Element 3.2-Contribute is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="SE2-3.2.1_Element3.2.1EmptyRecommended" xml:lang="en">SE2-3.2.1_Element 3.2.1-Role is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P1Source-3.2.1_Element3.2.1UndefinedSourceRecommended" xml:lang="en">P1Source-3.2.1_Element Source of 3.2.1-Role is undefined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P2Source-3.2.1_Element3.2.1EmptySourceRecommended" xml:lang="en">P2Source-3.2.1_Element Source of 3.2.1-Role is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P1Value-3.2.1_Element3.2.1UndefinedValueRecommended" xml:lang="en">P1Value-3.2.1_Element Value of 3.2.1-Role is undefined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P2Value-3.2.1_Element3.2.1EmptyValueRecommended" xml:lang="en">P2Value-3.2.1_Element Value of 3.2.1-Role is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="SE2-3.2.2_Element3.2.2EmptyRecommended" xml:lang="en">SE2-3.2.2_Element 3.2.2-Entity is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="SE2-3.2.3_Element3.2.3EmptyRecommended" xml:lang="en">SE2-3.2.3_Element 3.2.3-Date is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P1DateTime-3.2.3_Element3.2.3UndefinedDateTimeRecommended" xml:lang="en">P1DateTime-3.2.3_Element DateTime of 3.2.3-Date is undefined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P2DateTime-3.2.3_Element3.2.3EmptyDateTimeRecommended" xml:lang="en">P2DateTime-3.2.3_Element DateTime of 3.2.3-Date is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P1Description-3.2.3_Element3.2.3UndefinedDescriptionRecommended" xml:lang="en">P1Description-3.2.3_Element Description of 3.2.3-Date is undefined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P2Description-3.2.3_Element3.2.3EmptyDescriptionRecommended" xml:lang="en">P2Description-3.2.3_Element Description of 3.2.3-Date is empty.  This element is recommended.</iso:diagnostic>

        <iso:diagnostic id="E2-3.4_Element3.4EmptyRecommended" xml:lang="en">E2-3.4_Element 3.4-Language is empty.  This element is recommended.</iso:diagnostic>

        <!-- Mandatory Elements (Technical) -->
        <iso:diagnostic id="E1-4.1_Element4.1UndefinedMandatory" xml:lang="en">Element 4.1-Format is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="E1-4.3_Element4.3UndefinedMandatory" xml:lang="en">Element 4.3-Location is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element4.1EmptyMandatory" xml:lang="en">Element 4.1-Format is empty.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element4.3EmptyMandatory" xml:lang="en">Element 4.3-Location is empty.  This element is mandatory.</iso:diagnostic>

        <!-- Recommended Elements (Technical) --> 
        <iso:diagnostic id="Element4.2UndefinedRecommended" xml:lang="en">Element 4.2-Size is not defined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="Element4.5UndefinedRecommended" xml:lang="en">Element 4.5-InstallationRemarks is not defined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="Element4.6UndefinedRecommended" xml:lang="en">Element 4.6-OtherPlatformRequirements is not defined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="E2-4.2_Element4.2EmptyRecommended" xml:lang="en">E2-4.2_Element 4.2-Size is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="SE2-4.4.1.1_Element4.4.1.1EmptyRecommended" xml:lang="en">SE2-4.4.1.1_Element 4.4.1.1-Type is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P1Source-4.4.1.1_Element4.4.1.1UndefinedSourceRecommended" xml:lang="en">P1Source-4.4.1.1_Element Source of 4.4.1.1-Type is undefined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P2Source-4.4.1.1_Element4.4.1.1EmptySourceRecommended" xml:lang="en">P2Source-4.4.1.1_Element Source of 4.4.1.1-Type is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P1Value-4.4.1.1_Element4.4.1.1UndefinedValueRecommended" xml:lang="en">P1Value-4.4.1.1_Element Value of 4.4.1.1-Type is undefined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P2Value-4.4.1.1_Element4.4.1.1EmptyValueRecommended" xml:lang="en">P2Value-4.4.1.1_Element Value of 4.4.1.1-Type is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="SE2-4.4.1.2_Element4.4.1.2EmptyRecommended" xml:lang="en">SE2-4.4.1.2_Element 4.4.1.2-Name is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P1Source-4.4.1.2_Element4.4.1.2UndefinedSourceRecommended" xml:lang="en">P1Source-4.4.1.2_Element Source of 4.4.1.2-Name is undefined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P2Source-4.4.1.2_Element4.4.1.2EmptySourceRecommended" xml:lang="en">P2Source-4.4.1.2_Element Source of 4.4.1.2-Name is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P1Value-4.4.1.2_Element4.4.1.2UndefinedValueRecommended" xml:lang="en">P1Value-4.4.1.2_Element Value of 4.4.1.2-Name is undefined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P2Value-4.4.1.2_Element4.4.1.2EmptyValueRecommended" xml:lang="en">P2Value-4.4.1.2_Element Value of 4.4.1.2-Name is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="SE2-4.4.1.3_Element4.4.1.3EmptyRecommended" xml:lang="en">SE2-4.4.1.3_Element 4.4.1.3-Minimum Version is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="SE2-4.4.1.4_Element4.4.1.4EmptyRecommended" xml:lang="en">SE2-4.4.1.4_Element 4.4.1.4-Maximum Version is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="E2-4.5_Element4.5EmptyRecommended" xml:lang="en">E2-4.5_Element 4.5-InstallationRemarks is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="E2-4.6_Element4.6EmptyRecommended" xml:lang="en">E2-4.6_Element 4.6-OtherPlatformRequirements is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="E2-4.7_Element4.7EmptyRecommended" xml:lang="en">E2-4.7_Element 4.7-Duration is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P1Duration-4.7_Element4.7UndefinedDurationRecommended" xml:lang="en">P1Duration-4.7_Element Duration of 4.7-Duration is undefined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P2Duration-4.7_Element4.7EmptyDurationRecommended" xml:lang="en">P2Duration-4.7_Element Duration of 4.7-Duration is empty.  This element is recommended.</iso:diagnostic>

        <!-- Mandatory Elements (Educational) -->
        <iso:diagnostic id="E1-5.2_Element5.2UndefinedMandatory" xml:lang="en">Element 5.2-LearningResourceType is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="P1Source-5.2_Element5.2UndefinedSourceMandatory" xml:lang="en">P1Source-5.2_Element Source of 5.2-LearningResourceType is undefined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="P2Source-5.2_Element5.2EmptySourceMandatory" xml:lang="en">P2Source-5.2_Element Source of 5.2-LearningResourceType is empty.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="P1Value-5.2_Element5.2UndefinedValueMandatory" xml:lang="en">P1Value-5.2_Element Value of 5.2-LearningResourceType is undefined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="P2Value-5.2_Element5.2EmptyValueMandatory" xml:lang="en">P2Value-5.2_Element Value of 5.2-LearningResourceType is empty.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="E1-5.6_Element5.6UndefinedMandatory" xml:lang="en">Element 5.6-Context is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="P1Source-5.6_Element5.6UndefinedSourceMandatory" xml:lang="en">P1Source-5.6_Element Source of 5.6-Context is undefined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="P2Source-5.6_Element5.6EmptySourceMandatory" xml:lang="en">P2Source-5.6_Element Source of 5.6-Context is empty.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="P1Value-5.6_Element5.6UndefinedValueMandatory" xml:lang="en">P1Value-5.6_Element Value of 5.6-Context is undefined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="P2Value-5.6_Element5.6EmptyValueMandatory" xml:lang="en">P2Value-5.6_Element Value of 5.6-Context is empty.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element5.2EmptyMandatory" xml:lang="en">Element 5.2-LearningResourceType is empty.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element5.6EmptyMandatory" xml:lang="en">Element 5.6-Context is empty.  This element is mandatory.</iso:diagnostic>

        <!-- Recommended Elements (Educational) --> 
        <iso:diagnostic id="Element5.5UndefinedRecommended" xml:lang="en">Element 5.5-IntendedEndUserRole is not defined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="Element5.7UndefinedRecommended" xml:lang="en">Element 5.7-TypicalAgeRange is not defined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="Element5.9UndefinedRecommended" xml:lang="en">Element 5.9-TypicalLearningTime is not defined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="E2-5.1_Element5.1EmptyRecommended" xml:lang="en">E2-5.1_Element 5.1-InteractivityType is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P1Source-5.1_Element5.1UndefinedSourceRecommended" xml:lang="en">P1Source-5.1_Element Source of 5.1-Interactivity type is undefined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P2Source-5.1_Element5.1EmptySourceRecommended" xml:lang="en">P2Source-5.1_Element Source of 5.1-Interactivity type is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P1Value-5.1_Element5.1UndefinedValueRecommended" xml:lang="en">P1Value-5.1_Element Value of 5.1-Interactivity type is undefined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P2Value-5.1_Element5.1EmptyValueRecommended" xml:lang="en">P2Value-5.1_Element Value of 5.1-Interactivity type is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="E2-5.3_Element5.3EmptyRecommended" xml:lang="en">E2-5.3_Element 5.3-InteractivityLevel is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P1Source-5.3_Element5.3UndefinedSourceRecommended" xml:lang="en">P1Source-5.3_Element Source of 5.3-Interactivity level is undefined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P2Source-5.3_Element5.3EmptySourceRecommended" xml:lang="en">P2Source-5.3_Element Source of 5.3-Interactivity level is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P1Value-5.3_Element5.3UndefinedValueRecommended" xml:lang="en">P1Value-5.3_Element Value of 5.3-Interactivity level is undefined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P2Value-5.3_Element5.3EmptyValueRecommended" xml:lang="en">P2Value-5.3_Element Value of 5.3-Interactivity level is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="E2-5.4_Element5.4EmptyRecommended" xml:lang="en">E2-5.4_Element 5.4-SemanticDensity is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P1Source-5.4_Element5.4UndefinedSourceRecommended" xml:lang="en">P1Source-5.4_Element Source of 5.4-Semantic density is undefined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P2Source-5.4_Element5.4EmptySourceRecommended" xml:lang="en">P2Source-5.4_Element Source of 5.4-Semantic density is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P1Value-5.4_Element5.4UndefinedValueRecommended" xml:lang="en">P1Value-5.4_Element Value of 5.4-Semantic density is undefined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P2Value-5.4_Element5.4EmptyValueRecommended" xml:lang="en">P2Value-5.4_Element Value of 5.4-Semantic density is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="E2-5.5_Element5.5EmptyRecommended" xml:lang="en">E2-5.5_Element 5.5-IntendedEndUserRole is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P1Source-5.5_Element5.5UndefinedSourceRecommended" xml:lang="en">P1Source-5.5_Element Source of 5.5-Intended end user role is undefined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P2Source-5.5_Element5.5EmptySourceRecommended" xml:lang="en">P2Source-5.5_Element Source of 5.5-Intended end user role is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P1Value-5.5_Element5.5UndefinedValueRecommended" xml:lang="en">P1Value-5.5_Element Value of 5.5-Intended end user role is undefined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P2Value-5.5_Element5.5EmptyValueRecommended" xml:lang="en">P2Value-5.5_Element Value of 5.5-Intended end user role is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="E2-5.7_Element5.7EmptyRecommended" xml:lang="en">E2-5.7_Element 5.7-TypicalAgeRange is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="E2-5.8_Element5.8EmptyRecommended" xml:lang="en">E2-5.8_Element 5.8-Difficulty is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P1Source-5.8_Element5.8UndefinedSourceRecommended" xml:lang="en">P1Source-5.8_Element Source of 5.8-Difficulty is undefined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P2Source-5.8_Element5.8EmptySourceRecommended" xml:lang="en">P2Source-5.8_Element Source of 5.8-Difficulty is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P1Value-5.8_Element5.8UndefinedValueRecommended" xml:lang="en">P1Value-5.8_Element Value of 5.8-Difficulty is undefined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P2Value-5.8_Element5.8EmptyValueRecommended" xml:lang="en">P2Value-5.8_Element Value of 5.8-Difficulty is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="E2-5.9_Element5.9EmptyRecommended" xml:lang="en">E2-5.9_Element 5.9-TypicalLearningTime is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P1Duration-5.9_Element5.9UndefinedDurationRecommended" xml:lang="en">P1Duration-5.9_Element Duration of 5.9-TypicalLearningTime is undefined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P2Duration-5.9_Element5.9EmptyDurationRecommended" xml:lang="en">P2Duration-5.9_Element Duration of 5.9-TypicalLearningTime is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="E2-5.10_Element5.10EmptyRecommended" xml:lang="en">E2-5.10_Element 5.10-Description is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="E2-5.11_Element5.11EmptyRecommended" xml:lang="en">E2-5.11_Element 5.11-Language is empty.  This element is recommended.</iso:diagnostic>

        <!-- Recommended Elements (Educational) --> 
        <iso:diagnostic id="E1-7.1_Element7.1UndefinedRecommended" xml:lang="en">E1-7.1_Element 7.1-Type is not defined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="E2-7.1_Element7.1EmptyRecommended" xml:lang="en">E2-7.1_Element 7.1-Type is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P1Source-7.1_Element7.1UndefinedSourceRecommended" xml:lang="en">P1Source-7.1_Element Source of 7.1-Kind is undefined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P2Source-7.1_Element7.1EmptySourceRecommended" xml:lang="en">P2Source-7.1_Element Source of 7.1-Kind is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P1Value-7.1_Element7.1UndefinedValueRecommended" xml:lang="en">P1Value-7.1_Element Value of 7.1-Kind is undefined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P2Value-7.1_Element7.1EmptyValueRecommended" xml:lang="en">P2Value-7.1_Element Value of 7.1-Kind is empty.  This element is recommended.</iso:diagnostic>

        <!-- Mandatory Elements (Rights) --> 
        <iso:diagnostic id="E1-6.1_Element6.1UndefinedMandatory" xml:lang="en">E1-6.1_Element 6.1-Cost is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="E1-6.2_Element6.2UndefinedMandatory" xml:lang="en">E1-6.2_Element 6.2-CopyrightAndOtherRestrictions is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="E2-6.1_Element6.1EmptyMandatory" xml:lang="en">E2-6.1_Element 6.1-Cost is empty.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="P1Source-6.1_Element6.1UndefinedSourceMandatory" xml:lang="en">P1Source-6.1_Element Source of 6.1-Cost is undefined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="P2Source-6.1_Element6.1EmptySourceMandatory" xml:lang="en">P2Source-6.1_Element Source of 6.1-Cost is empty.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="P1Value-6.1_Element6.1UndefinedValueMandatory" xml:lang="en">P1Value-6.1_Element Value of 6.1-Cost is undefined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="P2Value-6.1_Element6.1EmptyValueMandatory" xml:lang="en">P2Value-6.1_Element Value of 6.1-Cost is empty.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="E2-6.2_Element6.2EmptyMandatory" xml:lang="en">E2-6.2_Element 6.2-CopyrightAndOtherRestrictions is empty.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="P1Source-6.2_Element6.2UndefinedSourceMandatory" xml:lang="en">P1Source-6.2_Element Source of 6.2-CopyrightAndOtherRestrictions is undefined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="P2Source-6.2_Element6.2EmptySourceMandatory" xml:lang="en">P2Source-6.2_Element Source of 6.2-CopyrightAndOtherRestrictions is empty.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="P1Value-6.2_Element6.2UndefinedValueMandatory" xml:lang="en">P1Value-6.2_Element Value of 6.2-CopyrightAndOtherRestrictions is undefined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="P2Value-6.2_Element6.2EmptyValueMandatory" xml:lang="en">P2Value-6.2_Element Value of 6.2-CopyrightAndOtherRestrictions is empty.  This element is mandatory.</iso:diagnostic>

        <!-- Conditional Mandatory Elements (Rights) -->
        <iso:diagnostic id="Element6.3MandatoryBecause6.2Yes" xml:lang="en">As element 6.2-CopyrightAndOtherRestrictions's value is 'yes', the element 6.3-Description is mandatory.</iso:diagnostic>

        <!-- Recommended Elements (Relation) -->
        <iso:diagnostic id="SE2-7.2.1.1_Element7.2.1.1EmptyRecommended" xml:lang="en">SE2-7.2.1.1_Element 7.2.1.1-Catalog is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="SE2-7.2.1.2_Element7.2.1.2EmptyRecommended" xml:lang="en">SE2-7.2.1.2_Element 7.2.1.2-Entry is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="SE2-7.2.2_Element7.2.2EmptyRecommended" xml:lang="en">SE2-7.2.2_Element 7.2.2-Description is empty.  This element is recommended.</iso:diagnostic>

        <!-- Recommended Elements (Annotation) -->
        <iso:diagnostic id="E2-8.1_Element8.1EmptyRecommended" xml:lang="en">E2-8.1_Element 8.1-Entity is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="E2-8.2_Element8.2EmptyRecommended" xml:lang="en">E2-8.2_Element 8.2-Date is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P1DateTime-8.2_Element8.2UndefinedDateTimeRecommended" xml:lang="en">P1DateTime-8.2_Element DateTime of 8.2-Date is undefined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P2DateTime-8.2_Element8.2EmptyDateTimeRecommended" xml:lang="en">P2DateTime-8.2_Element DateTime of 8.2-Date is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P1Description-8.2_Element8.2UndefinedDescriptionRecommended" xml:lang="en">P1Description-8.2_Element Description of 8.2-Date is undefined.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="P2Description-8.2_Element8.2EmptyDescriptionRecommended" xml:lang="en">P2Description-8.2_Element Description of 8.2-Date is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="E2-8.3_Element8.3EmptyRecommended" xml:lang="en">E2-8.3_Element 8.3-Description is empty.  This element is recommended.</iso:diagnostic>

        <!-- Mandatory Elements (Classification) --> 
        <iso:diagnostic id="E1-9.1_Element9.1UndefinedMandatory" xml:lang="en">E1-9.1_Element 9.1-Purpose is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="P1Source-9.1_Element9.1UndefinedSourceMandatory" xml:lang="en">P1Source-9.1_Element Source of 9.1-Purpose is undefined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="P2Source-9.1_Element9.1EmptySourceMandatory" xml:lang="en">P2Source-9.1_Element Source of 9.1-Purpose is empty.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="P1Value-9.1_Element9.1UndefinedValueMandatory" xml:lang="en">P1Value-9.1_Element Value of 9.1-Purpose is undefined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="P2Value-9.1_Element9.1EmptyValueMandatory" xml:lang="en">P2Value-9.1_Element Value of 9.1-Purpose is empty.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="E1-9.2_Element9.2UndefinedMandatory" xml:lang="en">E1-9.2_Element 9.2-TaxonPath is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="E2-9.1_Element9.1EmptyMandatory" xml:lang="en">E2-9.1_Element 9.1-Purpose is empty.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="SE1-9.2.1_Element9.2.1UndefinedMandatory" xml:lang="en">SE(9.2.1)_Element 9.2.1-Source is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="Element9.2.2UndefinedMandatory" xml:lang="en">Element 9.2.2-Taxon is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="SE2-9.2.1_Element9.2.1EmptyMandatory" xml:lang="en">SE2-9.2.1_Element 9.2.1-Source is empty.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="SE1-9.2.2.1_Element9.2.2.1UndefinedMandatory" xml:lang="en">SE1-9.2.2.1_Element 9.2.2.1-Id is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="SE1-9.2.2.2_Element9.2.2.2UndefinedMandatory" xml:lang="en">SE1-9.2.2.2_Element 9.2.2.2-Entry is not defined.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="SE2-9.2.2.1_Element9.2.2.1EmptyMandatory" xml:lang="en">SE2-9.2.2.1_Element 9.2.2.1-Id is empty.  This element is mandatory.</iso:diagnostic>
        <iso:diagnostic id="SE2-9.2.2.2_Element9.2.2.2EmptyMandatory" xml:lang="en">SE2-9.2.2.2_Element 9.2.2.2-Entry is empty.  This element is mandatory.</iso:diagnostic>

        <!-- Recommended Elements (Classification) -->
        <iso:diagnostic id="E2-9.3_Element9.3EmptyRecommended" xml:lang="en">Element 9.3-Keyword is empty.  This element is recommended.</iso:diagnostic>
        <iso:diagnostic id="E2-9.4_Element9.4EmptyRecommended" xml:lang="en">Element 9.4-Keyword is empty.  This element is recommended.</iso:diagnostic>


        <!-- Recommended Attributes (General) -->
        <iso:diagnostic id="P1Language-1.2_Attribute1.2LanguageUndefinedRecommended" xml:lang="en">P1Language-1.2_Attribute1.2LanguageUndefinedRecommended</iso:diagnostic>
        <!--iso:diagnostic id="P2Language-1.2_Attribute1.2LanguageEmptyRecommended" xml:lang="en">P2Language-1.2_Attribute1.2LanguageEmptyRecommended</iso:diagnostic-->
        <iso:diagnostic id="P1-1.4_Attribute1.4LanguageUndefinedRecommended" xml:lang="en">P1-1.4_Attribute1.4LanguageUndefinedRecommended</iso:diagnostic>
        <!--iso:diagnostic id="P2-1.4_Attribute1.4LanguageEmptyRecommended" xml:lang="en">P2-1.4_Attribute1.4LanguageEmptyRecommended</iso:diagnostic-->
        <iso:diagnostic id="P1-1.5_Attribute1.5LanguageUndefinedRecommended" xml:lang="en">P1-1.5_Attribute1.5LanguageUndefinedRecommended</iso:diagnostic>
        <!--iso:diagnostic id="P2-1.5_Attribute1.5LanguageEmptyRecommended" xml:lang="en">P2-1.5_Attribute1.5LanguageEmptyRecommended</iso:diagnostic-->
        <iso:diagnostic id="P1-1.6_Attribute1.6LanguageUndefinedRecommended" xml:lang="en">P1-1.6_Attribute1.6LanguageUndefinedRecommended</iso:diagnostic>
        <!--iso:diagnostic id="P2-1.6_Attribute1.6LanguageEmptyRecommended" xml:lang="en">P2-1.6_Attribute1.6LanguageEmptyRecommended</iso:diagnostic-->

        <!-- Recommended Attributes (LifeCycle) -->
        <iso:diagnostic id="P1-2.1_Attribute2.1LanguageUndefinedRecommended" xml:lang="en">P1-2.1_Attribute2.1LanguageUndefinedRecommended</iso:diagnostic>
        <iso:diagnostic id="P2-2.1_Attribute2.1LanguageEmptyRecommended" xml:lang="en">P2-2.1_Attribute2.1LanguageEmptyRecommended</iso:diagnostic>
        <iso:diagnostic id="P1-2.3.3_Attribute2.3.3DateDescriptionLanguageUndefinedRecommended" xml:lang="en">P1-2.3.3_Attribute2.3.3DateDescriptionLanguageUndefinedRecommended</iso:diagnostic>
        <iso:diagnostic id="P2-2.3.3_Attribute2.3.3DateDescriptionLanguageEmptyRecommended" xml:lang="en">P2-2.3.3_Attribute2.3.3DateDescriptionLanguageEmptyRecommended</iso:diagnostic>

        <!-- Recommended Attributes (MetaMetadata) -->
        <iso:diagnostic id="P1-3.2.3_Attribute3.2.3DateDescriptionLanguageUndefinedRecommended" xml:lang="en">P1-3.2.3_Attribute3.2.3DateDescriptionLanguageUndefinedRecommended</iso:diagnostic>
        <iso:diagnostic id="P2-3.2.3_Attribute3.2.3DateDescriptionLanguageEmptyRecommended" xml:lang="en">P2-3.2.3_Attribute3.2.3DateDescriptionLanguageEmptyRecommended</iso:diagnostic>

        <!-- Recommended Attributes (Technical) -->
        <iso:diagnostic id="P1-4.5_Attribute4.5LanguageUndefinedRecommended" xml:lang="en">P1-4.5_Attribute4.5LanguageUndefinedRecommended</iso:diagnostic>
        <iso:diagnostic id="P2-4.5_Attribute4.5LanguageEmptyRecommended" xml:lang="en">P2-4.5_Attribute4.5LanguageEmptyRecommended</iso:diagnostic>
        <iso:diagnostic id="P1-4.6_Attribute4.6LanguageUndefinedRecommended" xml:lang="en">P1-4.6_Attribute4.6LanguageUndefinedRecommended</iso:diagnostic>
        <iso:diagnostic id="P2-4.6_Attribute4.6LanguageEmptyRecommended" xml:lang="en">P2-4.6_Attribute4.6LanguageEmptyRecommended</iso:diagnostic>
        <iso:diagnostic id="P1-4.7_Attribute4.7LanguageUndefinedRecommended" xml:lang="en">P1-4.7_Attribute4.7LanguageUndefinedRecommended</iso:diagnostic>
        <iso:diagnostic id="P2-4.7_Attribute4.7LanguageEmptyRecommended" xml:lang="en">P2-4.7_Attribute4.7LanguageEmptyRecommended</iso:diagnostic>

        <!-- Recommended Attributes (Educational) -->
        <iso:diagnostic id="P1-5.7_Attribute5.7LanguageUndefinedRecommended" xml:lang="en">P1-5.7_Attribute5.7LanguageUndefinedRecommended</iso:diagnostic>
        <iso:diagnostic id="P2-5.7_Attribute5.7LanguageEmptyRecommended" xml:lang="en">P2-5.7_Attribute5.7LanguageEmptyRecommended</iso:diagnostic>
        <iso:diagnostic id="P1-5.9_Attribute5.9LanguageUndefinedRecommended" xml:lang="en">P1-5.9_Attribute5.9LanguageUndefinedRecommended</iso:diagnostic>
        <iso:diagnostic id="P2-5.9_Attribute5.9LanguageEmptyRecommended" xml:lang="en">P2-5.9_Attribute5.9LanguageEmptyRecommended</iso:diagnostic>
        <iso:diagnostic id="P1-5.10_Attribute5.10LanguageUndefinedRecommended" xml:lang="en">P1-5.10_Attribute5.10LanguageUndefinedRecommended</iso:diagnostic>
        <iso:diagnostic id="P2-5.10_Attribute5.10LanguageEmptyRecommended" xml:lang="en">P2-5.10_Attribute5.10LanguageEmptyRecommended</iso:diagnostic>

        <!-- Recommended Attributes (Rights) -->
        <iso:diagnostic id="P1-6.3_Attribute6.3LanguageUndefinedRecommended" xml:lang="en">P1-6.3_Attribute6.3LanguageUndefinedRecommended</iso:diagnostic>
        <iso:diagnostic id="P2-6.3_Attribute6.3LanguageEmptyRecommended" xml:lang="en">P2-6.3_Attribute6.3LanguageEmptyRecommended</iso:diagnostic>

        <!-- Recommended Attributes (Relation) -->
        <iso:diagnostic id="P1-7.2.2_Attribute7.2.2LanguageUndefinedRecommended" xml:lang="en">P1-7.2.2_Attribute7.2.2LanguageUndefinedRecommended</iso:diagnostic>
        <iso:diagnostic id="P2-7.2.2_Attribute7.2.2LanguageEmptyRecommended" xml:lang="en">P2-7.2.2_Attribute7.2.2LanguageEmptyRecommended</iso:diagnostic>

        <!-- Recommended Attributes (Annotation) -->
        <iso:diagnostic id="P1-8.2_Attribute8.2LanguageUndefinedRecommended" xml:lang="en">P1-8.2_Attribute8.2LanguageUndefinedRecommended</iso:diagnostic>
        <iso:diagnostic id="P2-8.2_Attribute8.2LanguageEmptyRecommended" xml:lang="en">P2-8.2_Attribute8.2LanguageEmptyRecommended</iso:diagnostic>
        <iso:diagnostic id="P1-8.3_Attribute8.3LanguageUndefinedRecommended" xml:lang="en">P1-8.3_Attribute8.3LanguageUndefinedRecommended</iso:diagnostic>
        <iso:diagnostic id="P2-8.3_Attribute8.3LanguageEmptyRecommended" xml:lang="en">P2-8.3_Attribute8.3LanguageEmptyRecommended</iso:diagnostic>

        <!-- Recommended Attributes (Classification) -->
        <iso:diagnostic id="P1-9.2.1_Attribute9.2.1LanguageUndefinedRecommended" xml:lang="en">P1-9.2.1_Attribute9.2.1LanguageUndefinedRecommended</iso:diagnostic>
        <iso:diagnostic id="P2-9.2.1_Attribute9.2.1LanguageEmptyRecommended" xml:lang="en">P2-9.2.1_Attribute9.2.1LanguageEmptyRecommended</iso:diagnostic>
        <iso:diagnostic id="P1-9.2.2.2_Attribute9.2.2.2LanguageUndefinedRecommended" xml:lang="en">P1-9.2.2.2_Attribute9.2.2.2LanguageUndefinedRecommended</iso:diagnostic>
        <iso:diagnostic id="P2-9.2.2.2_Attribute9.2.2.2LanguageEmptyRecommended" xml:lang="en">P2-9.2.2.2_Attribute9.2.2.2LanguageEmptyRecommended</iso:diagnostic>
        <iso:diagnostic id="P1-9.3_Attribute9.3LanguageUndefinedRecommended" xml:lang="en">P1-9.3_Attribute9.3LanguageUndefinedRecommended</iso:diagnostic>
        <iso:diagnostic id="P2-9.3_Attribute9.3LanguageEmptyRecommended" xml:lang="en">P2-9.3_Attribute9.3LanguageEmptyRecommended</iso:diagnostic>
        <iso:diagnostic id="P1-9.4_Attribute9.4LanguageUndefinedRecommended" xml:lang="en">P1-9.4_Attribute9.4LanguageUndefinedRecommended</iso:diagnostic>
        <iso:diagnostic id="P2-9.4_Attribute9.4LanguageEmptyRecommended" xml:lang="en">P2-9.4_Attribute9.4LanguageEmptyRecommended</iso:diagnostic>

        <!-- Language Attributes --> 
        <iso:diagnostic id="ElementWithIllegalLangString" xml:lang="en">Element <iso:name/> has a LangString element with an illegal language attribute.</iso:diagnostic>
        <iso:diagnostic id="ElementWithUnrecognizedLanguageCode" xml:lang="en">Element <iso:name/> has a LangString element with an illegal language attribute.  The language code is not recognized.</iso:diagnostic>
        <iso:diagnostic id="ElementWithUnrecognizedCountryCode" xml:lang="en">Element <iso:name/> has a LangString element with an illegal language attribute.  The country code is not recognized.</iso:diagnostic>

        <!-- Vocabularies (Educational) -->
        <iso:diagnostic id="UnrecognizedVocabularySourceForElement5.2" xml:lang="en">Unrecognized source for element 5.2-LearningResourceType.</iso:diagnostic>
        <iso:diagnostic id="P3Value-5.2_InvalidVocabularyForElement5.2" xml:lang="en">P3Value-5.2_Invalid vocabulary definition for element 5.2-LearningResourceType.</iso:diagnostic>
        <iso:diagnostic id="UnrecognizedVocabularySourceForElement5.6" xml:lang="en">Unrecognized source for element 5.6-Context.</iso:diagnostic>
        <iso:diagnostic id="P3Value-5.6_InvalidVocabularyForElement5.6" xml:lang="en">P3Value-5.6_Invalid vocabulary definition for element 5.6-Context.</iso:diagnostic>
    </iso:diagnostics>

</iso:schema>
