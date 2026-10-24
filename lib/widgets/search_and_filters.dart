import 'package:flutter/material.dart';
import '../models/job.dart';
import '../theme/app_theme.dart';

class SearchAndFilters extends StatelessWidget {
  final TextEditingController searchController;
  final ValueChanged<String> onSearchChanged;
  final VoidCallback onClearSearch;
  final JobCategory selectedCategory;
  final ValueChanged<JobCategory> onCategorySelected;
  final bool showSavedOnly;
  final int savedCount;
  final VoidCallback onToggleSavedFilter;

  const SearchAndFilters({
    super.key,
    required this.searchController,
    required this.onSearchChanged,
    required this.onClearSearch,
    required this.selectedCategory,
    required this.onCategorySelected,
    required this.showSavedOnly,
    required this.savedCount,
    required this.onToggleSavedFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Search text field + Saved filter toggle
        Row(
          children: [
            Expanded(
              child: Semantics(
                label: 'Search jobs by title, organization, location, or skills',
                textField: true,
                child: TextField(
                  controller: searchController,
                  onChanged: onSearchChanged,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    hintText: 'Search roles, skills, cities, or SDGs...',
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      color: AppTheme.textMedium,
                      size: 22,
                    ),
                    suffixIcon: searchController.text.isNotEmpty
                        ? Tooltip(
                            message: 'Clear search',
                            child: IconButton(
                              icon: const Icon(Icons.close_rounded, size: 20),
                              onPressed: onClearSearch,
                            ),
                          )
                        : null,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            // Saved roles toggle button
            Tooltip(
              message: showSavedOnly
                  ? 'Show all roles'
                  : 'View saved roles ($savedCount)',
              child: Semantics(
                button: true,
                selected: showSavedOnly,
                label: showSavedOnly
                    ? 'Showing saved roles. Tap to show all.'
                    : 'Show saved roles. $savedCount saved.',
                child: Material(
                  color: showSavedOnly ? AppTheme.amberHighlight : AppTheme.warmSurface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                    side: BorderSide(
                      color: showSavedOnly ? AppTheme.amberHighlight : AppTheme.warmBorder,
                      width: 1.2,
                    ),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(14),
                    onTap: onToggleSavedFilter,
                    child: Container(
                      height: 52,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            showSavedOnly ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                            size: 20,
                            color: showSavedOnly ? Colors.white : AppTheme.textMedium,
                          ),
                          if (savedCount > 0) ...[
                            const SizedBox(width: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: showSavedOnly ? Colors.white : AppTheme.leafTint,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                '$savedCount',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: showSavedOnly
                                      ? AppTheme.amberHighlight
                                      : AppTheme.primaryGreen,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        // Horizontally scrollable category filters
        SizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: JobCategory.values.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final category = JobCategory.values[index];
              final isSelected = selectedCategory == category && !showSavedOnly;

              return FilterChip(
                selected: isSelected,
                label: Text(category.displayName),
                onSelected: (_) {
                  if (showSavedOnly) {
                    onToggleSavedFilter(); // turn off saved filter when category clicked
                  }
                  onCategorySelected(category);
                },
                backgroundColor: AppTheme.warmSurface,
                selectedColor: AppTheme.primaryGreen,
                labelStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected ? Colors.white : AppTheme.textMedium,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: isSelected ? AppTheme.primaryGreen : AppTheme.warmBorder,
                    width: 1,
                  ),
                ),
                showCheckmark: false,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              );
            },
          ),
        ),
      ],
    );
  }
}
