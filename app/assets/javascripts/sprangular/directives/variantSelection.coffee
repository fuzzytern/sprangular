'use strict'

Sprangular.directive 'variantSelection', ->
  restrict: 'E'
  templateUrl: 'directives/variant_selection.html'
  scope:
    product: '='
    variant: '='
    change: '&'
  controller: ($scope) ->
    $scope.values = {}

    $scope.$watch 'variant', ->
      $scope.change()

    $scope.isValueSelected = (value) ->
      $scope.values[value.option_type_id]?.id == value.id

    $scope.isValueAvailable = (value) ->
      $scope.product.availableValues(_.values($scope.values))

    $scope.selectValue = (value) ->
      $scope.values[value.option_type_id] = value
      $scope.variant = $scope.product.variantForValues(_.values($scope.values))