member_id="6f045a0b-c90a-41e6-b91c-958fb301f036"
# INSIGHT IL2
az ad group member add --AzPortal-Priv-ATEC-INSIGHT-D-01
                       --$member_id
# INSIGHT IL5
az ad group member add --AzPortal-Priv-ATEC-INSIGHT-S-01
                       --$member_id
# MGMT IL2
az ad group member add --AzPortal-Priv-ATEC-MGMT-D-01
                       --$member_id
# MGMT IL5
az ad group member add --AzPortal-Priv-ATEC-MGMT-S-01
                       --$member_id
# DOMAIN IL2
az ad group member add --AzPortal-Priv-ATEC-DOMAIN-D-01
                       --$member_id
# DOMAIN IL5
az ad group member add --AzPortal-Priv-ATEC-DOMAIN-S-01
                       --$member_id





