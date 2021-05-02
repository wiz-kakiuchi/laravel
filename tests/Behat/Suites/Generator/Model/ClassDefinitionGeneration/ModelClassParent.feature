Feature: Model Class Parent
  In order to work with base models
  As a developer
  I want to my models to inherit from an abstract model

  Background:
    Given a default ModelGeneratorConfiguration
    And ModelGeneratorConfiguration class suffix is "Model"
    And a default DatabaseBlueprintConfiguration
    And a new DatabaseBlueprint
    And the DatabaseBlueprint has SchemaBlueprint "sample"

  Scenario Outline: abstract class extends from parent class
    Given SchemaBlueprint "sample" has TableBlueprint "<table>"
    And ModelGeneratorConfiguration parent is "<parentClassName>"
    And a ModelGenerator is created
    When a Model ClassDefinition is generated
    Then last AbstractClassDefinition extends from "<parentClassName>"

    Examples:
      |  table  |   parentClassName  |
      |  users  |     \UserModel     |
      |  users  |   \UserEloquent    |