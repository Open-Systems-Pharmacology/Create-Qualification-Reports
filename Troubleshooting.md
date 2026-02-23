* If a workflow fails in the first step (`check-branch`): start a new workflow run and make sure that the workflow starts **not** from the branch `main`

  <img width="500" src="https://github.com/user-attachments/assets/f8a55fe8-97ad-4caa-99da-c00e57e8ca83" />

---

* If [Create evaluation reports and projects](../../actions/workflows/create-evaluation_reports.yml) workflow fails in the `read-inputs` step:
  * Go to the [Validate models.csv](../../actions/workflows/check-models.yml) Workflow
   * Click the __Run workflow__ button 
   * Select the branch used in the **Create evaluation reports and projects** workflow.
   * Click the green __Run workflow__ button

    <img width="700" src="https://github.com/user-attachments/assets/1c7281b7-410a-40e5-8f28-2bcd5a898df8" />

  * If **Validate models.csv** workflow ends with errors: click on it.
    
    <img width="500" src="https://github.com/user-attachments/assets/f7583d97-2075-4395-b892-6d24a3afa76f" />

  * In the next window: click on every entry on the left which is marked as failed (red cross) and investigate the errors shown. Most likely, **models.csv** needs to be adjusted.
    
    <img src="https://github.com/user-attachments/assets/8c619837-a1c0-4ebe-bae5-3c01771db2b7" />

---

* If [Qualification Reports](../../actions/workflows/create-qualification_reports.yml) workflow fails in the `read-inputs` step:
  * Go to the [Validate qualifications.csv](../../actions/workflows/check-qualifications.yml) Workflow
   * Click the __Run workflow__ button 
   * Select the branch used in the **Qualification Reports** workflow.
   * Click the green __Run workflow__ button
   * If **Validate qualifications.csv** workflow ends with errors: investigate the errors in the same manner as described above. Most likely, **qualifications.csv** needs to be adjusted.

---
* If some of the matrix jobs in the last step fail: check if workflow created _artifacts_. 

  <img width="1482" height="901" alt="grafik" src="https://github.com/user-attachments/assets/21128c32-d27f-4713-bceb-cfca9b51c288" />
  
  * Download and unzip an artifact.
  * Analyze the log files for errors. Log files can be found e.g. here:
    * **.../re_input/temp/PROJECT_NAME/log.txt** <br>
    
    <img width="300" src="https://github.com/user-attachments/assets/9d3eee4c-d267-4c7f-bd45-3507bcfd35c6" />

    * **.../re_output/log-XXX.txt** <br>
    
    <img width="300" src="https://github.com/user-attachments/assets/ccd37155-403e-4db3-aa02-f07611fb1597" />


  In addition, click on every failed job and analyze the log error message shown on the right. <br>
  If you have alicense of GitHub Copilot, you can also click on the **Explain Error** button and get a further error explanation (and possibly some solutions) from Copilot.
  
  <img src="https://github.com/user-attachments/assets/a1d2dcf9-bced-424c-bfdf-6144c1ac0f94" />

---

* If **all** matrix jobs in the last step fail: it might be a misconfiguration in **tools.csv**. To verify this:
  * Go to the [Validate tools.csv](../../actions/workflows/check-tools.yml) Workflow
   * Click the __Run workflow__ button 
   * Select the branch used in the **Qualification Reports** (resp. **Create evaluation reports and projects**) workflow.
   * Click the green __Run workflow__ button
   * If **Validate tools.csv** workflow ends with errors: investigate the errors in the same manner as described above and fix **tools.csv**.

---

* If some of the matrix jobs in the last step fail: _sometimes_ it 's just a temporary glitch on GitHub (like in the example screenshot below).
  In such a case: try to *re-run only the failed jobs*
  <img width="1535" height="847" alt="grafik" src="https://github.com/user-attachments/assets/5e58d609-2ac8-48ec-8cf1-b982b060737a" />

--- 

* If none of the above helps, try deleting of the _GitHub Actions cache_ (see [Deleting cache entries](https://docs.github.com/en/actions/how-tos/manage-workflow-runs/manage-caches#deleting-cache-entries) for details).
  Then rerun the workflow.

--- 

* If you still cannot find the solution: open an issue [here](https://github.com/Open-Systems-Pharmacology/Create-Qualification-Reports/issues)
  * Include the link to your failed workflow run into the issue description.
    
    <img width="800" src="https://github.com/user-attachments/assets/42268a48-faa5-4f79-8a69-1f619352207e" />
