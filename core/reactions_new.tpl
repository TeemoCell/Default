{include file='header.tpl'}
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    {include file='navbar.tpl'}
    {include file='sidebar.tpl'}

    <div class="content-wrapper">
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">{$REACTIONS}</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                            <li class="breadcrumb-item active">{$CONFIGURATION}</li>
                            <li class="breadcrumb-item active">{$REACTIONS}</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                {include file='includes/update.tpl'}

                <div class="card">
                    <div class="card-body">
                        <h5 style="display:inline;">{$CREATING_REACTION}</h5>

                        <div class="float-md-right">
                            <a href="#" class="btn btn-warning" onclick="showCancelModal()">{$CANCEL}</a>
                        </div>

                        <hr />

                        {if isset($ERRORS) && count($ERRORS)}
                            <div class="alert alert-danger alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h5><i class="icon fas fa-exclamation-triangle"></i> {$ERRORS_TITLE}</h5>
                                <ul>
                                    {foreach from=$ERRORS item=error}
                                        <li>{$error}</li>
                                    {/foreach}
                                </ul>
                            </div>
                        {/if}

                        <form action="" method="post">
                            <div class="form-group">
                                <label for="InputReactionName">{$NAME}</label>
                                <input type="text" class="form-control" name="name"
                                        id="InputReactionName"
                                        placeholder="{$NAME}"
                                        value="{$NAME_VALUE}">
                            </div>

                            <div class="form-group">
                                <label for="InputReactionHTML">{$HTML}</label>
                                <input type="text" class="form-control" name="html"
                                        id="InputReactionHTML"
                                        placeholder="{$HTML}"
                                        value="{$HTML_VALUE}">
                            </div>

                            <div class="form-group">
                                <label for="InputReactionType">{$TYPE}</label>
                                <select name="type" class="form-control" id="InputReactionType">
                                    <option value="2">{$POSITIVE}</option>
                                    <option value="1">{$NEUTRAL}</option>
                                    <option value="-1">{$NEGATIVE}</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="InputEnabled">{$ENABLED}</label>
                                <input type="checkbox" name="enabled" class="js-switch"/>
                            </div>

                            <div class="form-group">
                                <input type="hidden" name="token"
                                        value="{$TOKEN}">
                                <input type="submit"
                                        value="{$SUBMIT}"
                                        class="btn btn-primary">
                            </div>
                        </form>

                    </div>
                </div>

                <!-- Spacing -->
                <div style="height:1rem;"></div>

            </div>
        </section>
    </div>

    <!-- Cancel modal -->
    <div class="modal fade" id="cancelModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">{$ARE_YOU_SURE}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    {$CONFIRM_CANCEL}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">{$NO}</button>
                    <a href="{$CANCEL_LINK}" class="btn btn-primary">{$YES}</a>
                </div>
            </div>
        </div>
    </div>

    {include file='footer.tpl'}

</div>
<!-- ./wrapper -->

{include file='scripts.tpl'}

<script type="text/javascript">
    function showCancelModal(){
        $('#cancelModal').modal().show();
    }
</script>

</body>
</html>