@api @files_sharing-app-required
Feature: auth

  Background:
    Given user "another-admin" has been created with default attributes and without skeleton files

  @skipOnOcis
  @issue-ocis-reva-30
  @smokeTest
  @skipOnBruteForceProtection @issue-brute_force_protection-112
  Scenario: send PUT request to OCS endpoints as admin with wrong password
    Given user "another-admin" has been added to group "admin"
    When user "another-admin" requests these endpoints with "PUT" including body "doesnotmatter" using password "invalid" about user "Alice"
      | endpoint                                         |
      | /ocs/v1.php/cloud/users/%username%               |
      | /ocs/v2.php/cloud/users/%username%               |
      | /ocs/v1.php/cloud/users/%username%/disable       |
      | /ocs/v2.php/cloud/users/%username%/disable       |
      | /ocs/v1.php/cloud/users/%username%/enable        |
      | /ocs/v2.php/cloud/users/%username%/enable        |
      | /ocs/v1.php/apps/files_sharing/api/v1/shares/123 |
      | /ocs/v2.php/apps/files_sharing/api/v1/shares/123 |
    Then the HTTP status code of responses on all endpoints should be "401"
    And the OCS status code of responses on all endpoints should be "997"

  @skipOnOcV10
  @issue-ocis-reva-30
  @issue-ocis-ocs-26
  @smokeTest
  #after fixing all issues delete this Scenario and use the one above
  Scenario: send PUT request to OCS endpoints as admin with wrong password
    When the administrator requests these endpoints with "PUT" with body "doesnotmatter" using password "invalid" about user "Alice"
      | endpoint                                         |
      | /ocs/v1.php/apps/files_sharing/api/v1/shares/123 |
      | /ocs/v2.php/apps/files_sharing/api/v1/shares/123 |
    Then the HTTP status code of responses on all endpoints should be "401"
    And the OCS status code of responses on all endpoints should be "notset"

  @skipOnOcV10
  @issue-ocis-reva-30
  @issue-ocis-ocs-26
  @smokeTest
  #after fixing all issues delete this Scenario and use the one above
  Scenario: send PUT request to OCS endpoints as admin with wrong password
    When the administrator requests these endpoints with "PUT" with body "doesnotmatter" using password "invalid" about user "Alice"
      | endpoint                                         |
      | /ocs/v1.php/cloud/users/%username%               |
    Then the HTTP status code of responses on all endpoints should be "200"
    And the OCS status code of responses on all endpoints should be "103"
    When the administrator requests these endpoints with "PUT" with body "doesnotmatter" using password "invalid" about user "Alice"
      | endpoint                                         |
      | /ocs/v2.php/cloud/users/%username%               |
    Then the HTTP status code of responses on all endpoints should be "400"
    And the OCS status code of responses on all endpoints should be "103"

  @skipOnOcV10
  @issue-ocis-reva-30
  @issue-ocis-ocs-28
  @smokeTest
  #after fixing all issues delete this Scenario and use the one above
  Scenario: send PUT request to OCS endpoints as admin with wrong password
    When the administrator requests these endpoints with "PUT" with body "doesnotmatter" using password "invalid" about user "Alice"
      | endpoint                                         |
      | /ocs/v1.php/cloud/users/%username%/disable       |
      | /ocs/v1.php/cloud/users/%username%/enable        |
    Then the HTTP status code of responses on all endpoints should be "200"
    And the OCS status code of responses on all endpoints should be "998"
    When the administrator requests these endpoints with "PUT" with body "doesnotmatter" using password "invalid" about user "Alice"
      | endpoint                                         |
      | /ocs/v2.php/cloud/users/%username%/disable       |
      | /ocs/v2.php/cloud/users/%username%/enable        |
    Then the HTTP status code of responses on all endpoints should be "404"
    And the OCS status code of responses on all endpoints should be "998"
