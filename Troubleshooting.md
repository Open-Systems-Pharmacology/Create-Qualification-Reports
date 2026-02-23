# Troubleshooting workflow failures

Use this guide when a report-generation workflow fails or produces an unexpected result.

* If a workflow fails in the first step (`check-branch`): start a new workflow run and make sure that the workflow is started from a branch other than `main`.

  <img width="500" src="https://github.com/user-attachments/assets/f8a55fe8-97ad-4caa-99da-c00e57e8ca83" />

---

* If [Create evaluation reports and projects](../../actions/workflows/create-evaluation_reports.yml) fails in the `read_inputs` step:
  * Go to the [Validate models.csv](../../actions/workflows/check-models.yml) Workflow
   * Click the __Run workflow__ button 
   * Select the branch used in the **Create evaluation reports and projects** workflow.
   * Click the green __Run workflow__ button

    <img width="700" src="https://github.com/user-attachments/assets/1c7281b7-410a-40e5-8f28-2bcd5a898df8" />

  * If the **Validate models.csv** workflow ends with errors: click on it.
    
    <img width="500" src="https://github.com/user-attachments/assets/f7583d97-2075-4395-b892-6d24a3afa76f" />

  * In the next window, click each failed entry on the left (red cross) and inspect the shown error messages. In most cases, **models.csv** needs to be adjusted.
    
    <img src="https://github.com/user-attachments/assets/8c619837-a1c0-4ebe-bae5-3c01771db2b7" />

---

* If [Create qualification reports](../../actions/workflows/create-qualification_reports.yml) fails in the `read_inputs` step:
  * Go to the [Validate qualifications.csv](../../actions/workflows/check-qualifications.yml) Workflow
   * Click the __Run workflow__ button 
    * Select the branch used in the **Create qualification reports** workflow.
    * Click the green __Run workflow__ button
    * If the **Validate qualifications.csv** workflow ends with errors: investigate the errors in the same way as described above. In most cases, **qualifications.csv** needs to be adjusted.

---

* If a workflow fails in the `read_inputs` step while installing R packages (e.g., `install.packages("jsonlite")`) or while reading CSV content:
  * Re-run the same workflow once to rule out a temporary network or runner issue.
  * Make sure the selected branch contains your latest CSV changes (push the branch again if needed).
  * Re-run the relevant validation workflow (**Validate models.csv** or **Validate qualifications.csv**) and fix all reported errors before starting a new report workflow run.

---
* If some matrix jobs in the last step fail: check whether the workflow created _artifacts_. 

  <img width="1482" height="901" alt="grafik" src="https://github.com/user-attachments/assets/21128c32-d27f-4713-bceb-cfca9b51c288" />
  
  * Download and unzip an artifact.
  * Analyze the log files for errors. Log files can be found e.g. here:
    * **.../re_input/temp/PROJECT_NAME/log.txt** <br>
    
    <img width="300" src="https://github.com/user-attachments/assets/9d3eee4c-d267-4c7f-bd45-3507bcfd35c6" />

    * **.../re_output/log-XXX.txt** <br>
    
    <img width="300" src="https://github.com/user-attachments/assets/ccd37155-403e-4db3-aa02-f07611fb1597" />


  In addition, click each failed job and inspect the error messages shown on the right. <br>
  If you have a GitHub Copilot license, you can also click **Explain Error** to get additional explanations and possible fixes.
  
  <img src="https://github.com/user-attachments/assets/a1d2dcf9-bced-424c-bfdf-6144c1ac0f94" />

---

* If all matrix jobs in the last step fail: this can indicate a misconfiguration in **tools.csv**. To verify this:
  * Go to the [Validate tools.csv](../../actions/workflows/check-tools.yml) Workflow
   * Click the __Run workflow__ button 
    * Select the branch used in the **Create qualification reports** (or **Create evaluation reports and projects**) workflow.
    * Click the green __Run workflow__ button
    * If the **Validate tools.csv** workflow ends with errors: investigate the errors in the same way as described above and fix **tools.csv**.

---

* If a matrix job fails in the last step (`Run evaluation` or `Run qualification`) with an error that points to model/qualification plotting or workflow configuration (for example: `Values 'plotConfiguration' are not included...`):
  * Download the job artifact and inspect the generated logs (`.../re_input/.../log.txt` and `.../re_output/log-XXX.txt`).
  * Verify that the selected `Released version` and `Workflow name` in `models.csv` / `qualifications.csv` are compatible with the selected tool versions in `tools.csv`.
  * If needed, try another known working release/branch of the model or qualification plan and run the workflow again.

---

* If some matrix jobs in the last step fail: _sometimes_ this is only a temporary GitHub runner glitch (as in the screenshot below).
  In that case, try to *re-run only the failed jobs*.
  <img width="1535" height="847" alt="grafik" src="https://github.com/user-attachments/assets/5e58d609-2ac8-48ec-8cf1-b982b060737a" />

--- 

* If none of the above helps, try deleting the _GitHub Actions cache_ (see [Deleting cache entries](https://docs.github.com/en/actions/how-tos/manage-workflow-runs/manage-caches#deleting-cache-entries) for details), then re-run the workflow.

---

* If the matrix job succeeds but no pull request is created:
  * Open the workflow log and check the `Create Pull Request` step output.
  * If no changes were detected, this means the generated report files are identical to the current files in your branch.
  * In that case, no further action is required unless you expected report changes.

--- 

* If you still cannot find a solution: open an issue [here](https://github.com/Open-Systems-Pharmacology/Create-Qualification-Reports/issues).
  * Include the link to your failed workflow run into the issue description.
    
    <img width="800" src="https://github.com/user-attachments/assets/42268a48-faa5-4f79-8a69-1f619352207e" />
