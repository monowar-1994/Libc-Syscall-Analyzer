; ModuleID = 'src/locale/newlocale.c'
source_filename = "src/locale/newlocale.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type { i8*, i64, [24 x i8], %struct.__locale_map* }

@__c_locale = external hidden constant %struct.__locale_struct, align 8
@__c_dot_utf8_locale = external hidden constant %struct.__locale_struct, align 8
@default_locale = internal global %struct.__locale_struct zeroinitializer, align 8
@default_ctype_locale = internal global %struct.__locale_struct zeroinitializer, align 8
@__locale_lock = external hidden global [1 x i32], align 4
@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@default_locale_init_done = internal unnamed_addr global i1 false, align 4

@newlocale = weak alias %struct.__locale_struct* (i32, i8*, %struct.__locale_struct*), %struct.__locale_struct* (i32, i8*, %struct.__locale_struct*)* @__newlocale

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define hidden i32 @__loc_is_allocated(%struct.__locale_struct* noundef readnone %0) local_unnamed_addr #0 {
  %2 = icmp ne %struct.__locale_struct* %0, null
  %3 = icmp ne %struct.__locale_struct* %0, @__c_locale
  %4 = and i1 %2, %3
  %5 = icmp ne %struct.__locale_struct* %0, @__c_dot_utf8_locale
  %6 = and i1 %5, %4
  %7 = icmp ne %struct.__locale_struct* %0, @default_locale
  %8 = and i1 %7, %6
  %9 = icmp ne %struct.__locale_struct* %0, @default_ctype_locale
  %10 = and i1 %9, %8
  %11 = zext i1 %10 to i32
  ret i32 %11
}

; Function Attrs: nounwind optsize strictfp
define %struct.__locale_struct* @__newlocale(i32 noundef %0, i8* noundef %1, %struct.__locale_struct* noundef %2) #1 {
  %4 = alloca %struct.__locale_struct, align 8
  tail call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @__locale_lock, i64 0, i64 0)) #5
  %5 = bitcast %struct.__locale_struct* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 48, i8* nonnull %5) #6
  %6 = icmp ne %struct.__locale_struct* %2, null
  br label %10

7:                                                ; preds = %23
  %8 = add nuw nsw i64 %11, 1
  %9 = icmp eq i64 %8, 6
  br i1 %9, label %27, label %10

10:                                               ; preds = %7, %3
  %11 = phi i64 [ 0, %3 ], [ %8, %7 ]
  %12 = trunc i64 %11 to i32
  %13 = shl nuw nsw i32 1, %12
  %14 = and i32 %13, %0
  %15 = icmp eq i32 %14, 0
  %16 = and i1 %6, %15
  br i1 %16, label %17, label %20

17:                                               ; preds = %10
  %18 = getelementptr inbounds %struct.__locale_struct, %struct.__locale_struct* %2, i64 0, i32 0, i64 %11
  %19 = load %struct.__locale_map*, %struct.__locale_map** %18, align 8, !tbaa !3
  br label %23

20:                                               ; preds = %10
  %21 = select i1 %15, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i64 0, i64 0), i8* %1
  %22 = tail call %struct.__locale_map* @__get_locale(i32 noundef %12, i8* noundef %21) #5
  br label %23

23:                                               ; preds = %20, %17
  %24 = phi %struct.__locale_map* [ %19, %17 ], [ %22, %20 ]
  %25 = getelementptr inbounds %struct.__locale_struct, %struct.__locale_struct* %4, i64 0, i32 0, i64 %11
  store %struct.__locale_map* %24, %struct.__locale_map** %25, align 8, !tbaa !3
  %26 = icmp eq %struct.__locale_map* %24, inttoptr (i64 -1 to %struct.__locale_map*)
  br i1 %26, label %68, label %7

27:                                               ; preds = %7
  %28 = icmp ne %struct.__locale_struct* %2, @__c_locale
  %29 = and i1 %6, %28
  %30 = icmp ne %struct.__locale_struct* %2, @__c_dot_utf8_locale
  %31 = and i1 %30, %29
  %32 = icmp ne %struct.__locale_struct* %2, @default_locale
  %33 = and i1 %32, %31
  %34 = icmp ne %struct.__locale_struct* %2, @default_ctype_locale
  %35 = and i1 %34, %33
  br i1 %35, label %36, label %38

36:                                               ; preds = %27
  %37 = bitcast %struct.__locale_struct* %2 to i8*
  br label %65

38:                                               ; preds = %27
  %39 = call i32 @memcmp(i8* noundef nonnull %5, i8* noundef bitcast (%struct.__locale_struct* @__c_locale to i8*), i64 noundef 48) #5
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %68, label %41

41:                                               ; preds = %38
  %42 = call i32 @memcmp(i8* noundef nonnull %5, i8* noundef bitcast (%struct.__locale_struct* @__c_dot_utf8_locale to i8*), i64 noundef 48) #5
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %68, label %44

44:                                               ; preds = %41
  %45 = load i1, i1* @default_locale_init_done, align 4
  br i1 %45, label %55, label %48

46:                                               ; preds = %48
  %47 = load %struct.__locale_map*, %struct.__locale_map** getelementptr inbounds (%struct.__locale_struct, %struct.__locale_struct* @default_locale, i64 0, i32 0, i64 0), align 8, !tbaa !3
  store %struct.__locale_map* %47, %struct.__locale_map** getelementptr inbounds (%struct.__locale_struct, %struct.__locale_struct* @default_ctype_locale, i64 0, i32 0, i64 0), align 8, !tbaa !3
  store i1 true, i1* @default_locale_init_done, align 4
  br label %55

48:                                               ; preds = %44, %48
  %49 = phi i64 [ %53, %48 ], [ 0, %44 ]
  %50 = trunc i64 %49 to i32
  %51 = call %struct.__locale_map* @__get_locale(i32 noundef %50, i8* noundef getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i64 0, i64 0)) #5
  %52 = getelementptr inbounds %struct.__locale_struct, %struct.__locale_struct* @default_locale, i64 0, i32 0, i64 %49
  store %struct.__locale_map* %51, %struct.__locale_map** %52, align 8, !tbaa !3
  %53 = add nuw nsw i64 %49, 1
  %54 = icmp eq i64 %53, 6
  br i1 %54, label %46, label %48

55:                                               ; preds = %46, %44
  %56 = call i32 @memcmp(i8* noundef nonnull %5, i8* noundef bitcast (%struct.__locale_struct* @default_locale to i8*), i64 noundef 48) #5
  %57 = icmp eq i32 %56, 0
  br i1 %57, label %68, label %58

58:                                               ; preds = %55
  %59 = call i32 @memcmp(i8* noundef nonnull %5, i8* noundef bitcast (%struct.__locale_struct* @default_ctype_locale to i8*), i64 noundef 48) #5
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %68, label %61

61:                                               ; preds = %58
  %62 = call i8* @__libc_malloc(i64 noundef 48) #5
  %63 = bitcast i8* %62 to %struct.__locale_struct*
  %64 = icmp eq i8* %62, null
  br i1 %64, label %68, label %65

65:                                               ; preds = %61, %36
  %66 = phi i8* [ %37, %36 ], [ %62, %61 ]
  %67 = phi %struct.__locale_struct* [ %2, %36 ], [ %63, %61 ]
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(48) %66, i8* noundef nonnull align 8 dereferenceable(48) %5, i64 48, i1 false) #6
  br label %68

68:                                               ; preds = %23, %38, %41, %55, %58, %61, %65
  %69 = phi %struct.__locale_struct* [ @__c_locale, %38 ], [ @__c_dot_utf8_locale, %41 ], [ @default_locale, %55 ], [ @default_ctype_locale, %58 ], [ %63, %61 ], [ %67, %65 ], [ null, %23 ]
  call void @llvm.lifetime.end.p0i8(i64 48, i8* nonnull %5) #6
  call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @__locale_lock, i64 0, i64 0)) #5
  ret %struct.__locale_struct* %69
}

; Function Attrs: optsize
declare hidden void @__lock(i32* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__unlock(i32* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: optsize
declare hidden %struct.__locale_map* @__get_locale(i32 noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: optsize
declare i32 @memcmp(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i8* @__libc_malloc(i64 noundef) local_unnamed_addr #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #4 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
