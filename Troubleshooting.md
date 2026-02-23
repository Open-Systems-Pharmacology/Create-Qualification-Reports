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

* If some/all of the matrix jobs in the last step fail: _sometimes_ it 's just a temporary glitch on GitHub (like in the example screenshot below).
  In such a case: try to *re-run only the failed jobs*
  <img width="1535" height="847" alt="grafik" src="https://github.com/user-attachments/assets/5e58d609-2ac8-48ec-8cf1-b982b060737a" />

* a
* a
* a
