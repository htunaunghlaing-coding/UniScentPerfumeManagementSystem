﻿namespace UniScentPerfumeManagementSystem.Domain.Models;

public class PageSettingResponseModel
{
    public int PageNo { get; set; } = 1;
    public int RowCount { get; set; } = 12;
    public int TotalRowCount { get; set; }
    public int TotalPageNo
    {
        get
        {
            var totalPageNo = TotalRowCount / RowCount;
            if (TotalRowCount % RowCount > 0)
                totalPageNo++;
            return totalPageNo;
        }
    }
}
