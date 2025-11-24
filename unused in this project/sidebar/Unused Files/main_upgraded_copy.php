      <nav class="navbar navbar-vertical navbar-expand-lg">
        <div class="collapse navbar-collapse" id="navbarVerticalCollapse">
          <!-- scrollbar removed-->
          <div class="navbar-vertical-content">
            <ul class="navbar-nav flex-column" id="navbarVerticalNav">
              <li class="nav-item">
                <!-- label-->
                <p class="navbar-vertical-label">Apps
                </p>
                <hr class="navbar-vertical-line" />


<?php generateSidebarMenu($con); ?>

                <!-- parent pages-->
                <div class="nav-item-wrapper"><a class="nav-link dropdown-indicator label-1" href="#nv-CRM" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="nv-CRM">
                    <div class="d-flex align-items-center">
                      <div class="dropdown-indicator-icon-wrapper"><span class="fas fa-caret-right dropdown-indicator-icon"></span></div><span class="nav-link-icon"><span data-feather="pie-chart"></span></span><span class="nav-link-text">CRM</span>
                    </div>
                  </a>
                  <div class="parent-wrapper label-1">
                    <ul class="nav collapse parent" data-bs-parent="#navbarVerticalCollapse" id="nv-CRM">
                      <li class="nav-item"><a class="nav-link" href="../apps/crm/analytics.html">
                          <div class="d-flex align-items-center"><span class="nav-link-text">Analytics</span>
                          </div>
                        </a>
                        <!-- more inner pages-->
                      </li>
                      <li class="nav-item"><a class="nav-link" href="temp_leads.php">
                          <div class="d-flex align-items-center"><span class="nav-link-text">Temp Leads</span>
                          </div>
                        </a>
                        <!-- more inner pages-->
                      </li>
                      <li class="nav-item"><a class="nav-link" href="leads.php">
                          <div class="d-flex align-items-center"><span class="nav-link-text">URN Leads</span>
                          </div>
                        </a>
                        <!-- more inner pages-->
                      </li>
                      <li class="nav-item"><a class="nav-link" href="callback_list.php">
                          <div class="d-flex align-items-center"><span class="nav-link-text">Calls</span>
                          </div>
                        </a>
                        <!-- more inner pages-->
                      </li>
                    </ul>
                  </div>
                </div>

                <!-- parent pages-->
                <div class="nav-item-wrapper"><a class="nav-link dropdown-indicator label-1" href="#nv-Transaction" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="nv-Transaction">
                    <div class="d-flex align-items-center">
                      <div class="dropdown-indicator-icon-wrapper"><span class="fas fa-caret-right dropdown-indicator-icon"></span></div><span class="nav-link-icon"><span data-feather="dollar-sign"></span></span><span class="nav-link-text">Fund Management</span>
                    </div>
                  </a>
                  <div class="parent-wrapper label-1">
                    <ul class="nav collapse parent" data-bs-parent="#navbarVerticalCollapse" id="nv-Transaction">
                      <li class="nav-item"><a class="nav-link" href="commission_history.php">
                          <div class="d-flex align-items-center"><span class="nav-link-text">Commission</span>
                          </div>
                        </a>
                        <!-- more inner pages-->
                      </li>
                    </ul>
                  </div>
                </div>

                <!-- parent pages-->
                <div class="nav-item-wrapper"><a class="nav-link dropdown-indicator label-1" href="#nv-Site" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="nv-Site">
                    <div class="d-flex align-items-center">
                      <div class="dropdown-indicator-icon-wrapper"><span class="fas fa-caret-right dropdown-indicator-icon"></span></div><span class="nav-link-icon"><span data-feather="dribbble"></span></span><span class="nav-link-text">Site Management</span>
                    </div>
                  </a>
                  <div class="parent-wrapper label-1">
                    <ul class="nav collapse parent" data-bs-parent="#navbarVerticalCollapse" id="nv-Site">
                      <li class="nav-item"><a class="nav-link" href="site_settings.php">
                          <div class="d-flex align-items-center"><span class="nav-link-text">Site Info</span>
                          </div>
                        </a>
                        <!-- more inner pages-->
                      </li>
                      <li class="nav-item"><a class="nav-link" href="menu_items.php">
                          <div class="d-flex align-items-center"><span class="nav-link-text">Site Menu</span>
                          </div>
                        </a>
                        <!-- more inner pages-->
                      </li>
                    </ul>
                  </div>
                </div>

                <!-- parent pages-->
                <div class="nav-item-wrapper"><a class="nav-link dropdown-indicator label-1" href="#nv-LEADS" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="nv-CRM">
                    <div class="d-flex align-items-center">
                      <div class="dropdown-indicator-icon-wrapper"><span class="fas fa-caret-right dropdown-indicator-icon"></span></div><span class="nav-link-icon"><span data-feather="users"></span></span><span class="nav-link-text">URN Management</span>
                    </div>
                  </a>
                  <div class="parent-wrapper label-1">
                    <ul class="nav collapse parent" data-bs-parent="#navbarVerticalCollapse" id="nv-LEADS">
                      <?php include_once("lead_management_menu_items.php") ?>
                    </ul>
                  </div>
                </div>



                <!-- parent pages-->
                <div class="nav-item-wrapper">
                  <a class="nav-link dropdown-indicator label-1" href="#nv-project-management" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="nv-project-management">
                    <div class="d-flex align-items-center">
                      <div class="dropdown-indicator-icon-wrapper"><span class="fas fa-caret-right dropdown-indicator-icon"></span></div><span class="nav-link-icon"><span data-feather="clipboard"></span></span><span class="nav-link-text">University Management</span>
                    </div>
                  </a>
                  <div class="parent-wrapper label-1">
                    <ul class="nav collapse parent" data-bs-parent="#navbarVerticalCollapse" id="nv-project-management">
                      <li class="nav-item"><a class="nav-link" href="view_course.php">
                          <div class="d-flex align-items-center"><span class="nav-link-text">Courses</span>
                          </div>
                        </a>
                        <!-- more inner pages-->
                      </li>
                      <li class="nav-item"><a class="nav-link" href="university_list.php">
                          <div class="d-flex align-items-center"><span class="nav-link-text">Universities</span>
                          </div>
                        </a>
                        <!-- more inner pages-->
                      </li>
                      <li class="nav-item"><a class="nav-link" href="portal_settings.php">
                          <div class="d-flex align-items-center"><span class="nav-link-text">Options</span>
                          </div>
                        </a>
                        <!-- more inner pages-->
                      </li>
                    </ul>
                  </div>
                </div>
                <!-- parent pages-->
                <div class="nav-item-wrapper">
                  <a class="nav-link dropdown-indicator label-1" href="#nv-user-management" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="nv-project-management">
                    <div class="d-flex align-items-center">
                      <div class="dropdown-indicator-icon-wrapper"><span class="fas fa-caret-right dropdown-indicator-icon"></span></div><span class="nav-link-icon"><span data-feather="user"></span></span><span class="nav-link-text">User Management</span>
                    </div>
                  </a>
                  <div class="parent-wrapper label-1">
                    <ul class="nav collapse parent" data-bs-parent="#navbarVerticalCollapse" id="nv-user-management">
                      <li class="nav-item"><a class="nav-link" href="staff_list.php">
                          <div class="d-flex align-items-center"><span class="nav-link-text">Staff</span>
                          </div>
                        </a>
                        <!-- more inner pages-->
                      </li>
                      <li class="nav-item"><a class="nav-link" href="agent_list.php">
                          <div class="d-flex align-items-center"><span class="nav-link-text">Agent</span>
                          </div>
                        </a>
                        <!-- more inner pages-->
                      </li>
                      </li>
                      <li class="nav-item"><a class="nav-link" href="sales_person_list.php">
                          <div class="d-flex align-items-center"><span class="nav-link-text">Sales Person</span>
                          </div>
                        </a>
                        <!-- more inner pages-->
                      </li>
                      <li class="nav-item"><a class="nav-link" href="application_point_list.php">
                          <div class="d-flex align-items-center"><span class="nav-link-text">Application Points</span>
                          </div>
                        </a>
                        <!-- more inner pages-->
                      </li>
                    </ul>
                  </div>
                </div>

                <!-- parent pages-->
                <div class="nav-item-wrapper">
                  <a class="nav-link dropdown-indicator label-1" href="#nv-report-management" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="nv-project-management">
                    <div class="d-flex align-items-center">
                      <div class="dropdown-indicator-icon-wrapper"><span class="fas fa-caret-right dropdown-indicator-icon"></span></div><span class="nav-link-icon"><span data-feather="file"></span></span><span class="nav-link-text">Report Management</span>
                    </div>
                  </a>
                  <div class="parent-wrapper label-1">
                    <ul class="nav collapse parent" data-bs-parent="#navbarVerticalCollapse" id="nv-report-management">
                      <li class="nav-item"><a class="nav-link" href="lead_source_report.php">
                          <div class="d-flex align-items-center"><span class="nav-link-text">Lead Source</span>
                          </div>
                        </a>
                        <!-- more inner pages-->
                      </li>
                      <li class="nav-item"><a class="nav-link" href="agent_report.php">
                          <div class="d-flex align-items-center"><span class="nav-link-text">Agent</span>
                          </div>
                        </a>
                        <!-- more inner pages-->
                      </li>
                      </li>
                      <li class="nav-item"><a class="nav-link" href="sales_person_report.php">
                          <div class="d-flex align-items-center"><span class="nav-link-text">Sales Person</span>
                          </div>
                        </a>
                        <!-- more inner pages-->
                      </li>
                      <li class="nav-item"><a class="nav-link" href="application_point_report.php">
                          <div class="d-flex align-items-center"><span class="nav-link-text">Application Points</span>
                          </div>
                        </a>
                        <!-- more inner pages-->
                      </li>
                      <li class="nav-item"><a class="nav-link" href="student_report.php">
                          <div class="d-flex align-items-center"><span class="nav-link-text">Student</span>
                          </div>
                        </a>
                        <!-- more inner pages-->
                      </li>
                      <li class="nav-item"><a class="nav-link" href="call_report.php">
                          <div class="d-flex align-items-center"><span class="nav-link-text">Calls</span>
                          </div>
                        </a>
                        <!-- more inner pages-->
                      </li>
                    </ul>
                  </div>
                </div>


                <!-- parent pages-->
                <div class="nav-item-wrapper"><a class="nav-link label-1" href="chat_list.php" role="button" data-bs-toggle="" aria-expanded="false">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span data-feather="message-square"></span></span><span class="nav-link-text-wrapper"><span class="nav-link-text">Chat</span></span>
                    </div>
                  </a>
                </div>
                <!-- parent pages-->
                <div class="nav-item-wrapper"><a class="nav-link label-1" href="../apps/calendar.html" role="button" data-bs-toggle="" aria-expanded="false">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span data-feather="calendar"></span></span><span class="nav-link-text-wrapper"><span class="nav-link-text">Calendar</span></span>
                    </div>
                  </a>
                </div>
              </li>
            </ul>
          </div>
        </div>
        <div class="navbar-vertical-footer">
          <button class="btn navbar-vertical-toggle border-0 fw-semibold w-100 white-space-nowrap d-flex align-items-center"><span class="uil uil-left-arrow-to-left fs-8"></span><span class="uil uil-arrow-from-right fs-8"></span><span class="navbar-vertical-footer-text ms-2">Collapsed View</span></button>
        </div>
      </nav>